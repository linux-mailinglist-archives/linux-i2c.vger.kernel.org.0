Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF291886FF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 15:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgCQOOM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 10:14:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:45998 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbgCQOOM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 10:14:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C223EABDC;
        Tue, 17 Mar 2020 14:14:10 +0000 (UTC)
Date:   Tue, 17 Mar 2020 15:14:09 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: VAIO EEPROM support in at24
Message-ID: <20200317151409.7940926c@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

As the legacy eeprom driver is being phased out, I am reviewing all its
use cases to ensure that the at24 driver will be a suitable replacement.

One issue I have found is the handling of specific EEPROMs found on the
SMBus of some Sony VAIO laptops. The legacy eeprom driver would expose
them to user-space, read-only for all users. It would also recognize
them as VAIO EEPROMs and would hide some bytes from non-root users
because these bytes contain the BIOS password in a lightly encoded form.

In order to keep the same level of functionality, we would have to offer
the same with the at24 driver. At this time, the user has to
instantiate a "24c02" device manually from user-space. By default this
device has permissions 600, which is insufficient for users, and
dangerous for root, so a quick chmod 444 is needed.

Without the password issue, I would just document the procedure and
live with it. However in order to protect the password from being read
by random users, the driver itself needs to know that it is dealing
with a specific type of EEPROM. It seems that we need to introduce a
new device flavor to the at24 driver for this purpose.

I see that we already have a number of specific flags (AT24_FLAG_SERIAL
and AT24_FLAG_MAC) so I suppose we could add something similar for
these VAIO EEPROMs. Something like:

/* Some Sony VAIO laptops have a 24c02 at 0x57 with product info */
AT24_CHIP_DATA(at24_data_sony_vaio, 2048 / 8,
	AT24_FLAG_READONLY | AT24_FLAG_IRUGO | AT24_FLAG_SONY_VAIO);

Then I suppose it's only a matter of conditionally zeroing a selected
range in at24_read() before it returns, to hide the password from
non-root users.

Before I start implementing the idea above, I would like to know if
anyone objects to it, or has a better idea?

Thanks,
-- 
Jean Delvare
SUSE L3 Support

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A384273E7E
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 11:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgIVJZL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 05:25:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:40358 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726424AbgIVJZL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 05:25:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 59BEDB1D2
        for <linux-i2c@vger.kernel.org>; Tue, 22 Sep 2020 09:25:47 +0000 (UTC)
Date:   Tue, 22 Sep 2020 11:25:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: i2c-tools 4.2 has been released
Message-ID: <20200922112509.3afb4673@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

A new version of i2c-tools was tagged and released this morning. You
can download i2c-tools 4.2 at the usual place:
https://www.kernel.org/pub/software/utils/i2c-tools/

It includes almost two years worth of fixes and improvements. Most
important changes are as follows:
  * Restrict I2C addresses 0x03-0x07
  * Fix short writes with mask in i2cset
  * Support messages using I2C_M_RECV_LEN in i2ctransfer
  * Add check for returned length from driver in i2ctransfer
  * Many improvements to decode-dimms, for both DDR3 and DDR4
  * Updated list of memory vendors
  * Add at24 driver support to decode-vaio
  * Add a manual page for libi2c
  * Let i2c-stub-from-dump read dumps from hexdump -C
You can check the CHANGES file for the complete list.

Note for packagers: it is now possible to preset CFLAGS and LDFLAGS.

-- 
Jean Delvare
SUSE L3 Support

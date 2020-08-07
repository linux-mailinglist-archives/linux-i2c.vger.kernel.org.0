Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CF923EA5B
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 11:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgHGJbt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 05:31:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:34548 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgHGJbt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 05:31:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 992C1AC55;
        Fri,  7 Aug 2020 09:32:05 +0000 (UTC)
Date:   Fri, 7 Aug 2020 11:31:46 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: VAIO EEPROM support in at24
Message-ID: <20200807113146.7557c18b@endymion>
In-Reply-To: <20200805163655.6cfa6e17@endymion>
References: <20200317151409.7940926c@endymion>
        <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
        <20200805163655.6cfa6e17@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 5 Aug 2020 16:36:55 +0200, Jean Delvare wrote:
> 1* Do we actually need to use a struct resource? With the current
>    requirements, that looks overkill to me. We really only need the
>    start and end offsets of the masked area (or start and length). Or
>    do you plan to ever support multiple masked ranges, and
>    resource.child would be used to daisy-chain these ranges? Personally
>    I would wait until the need exists.

Dang, turns out that the need already exists. I just found that the
eeprom driver masks *2* areas of the Sony VAIO EEPROMs. I should know
because I'm the one who made that change but that was 13 years ago and
my memory doesn't go that far back.

I'll think of a way to support that. Still not a big fan of
daisy-chained resource structs though. Maybe a generic post-processing
callback function would do... I'll give that a try.

-- 
Jean Delvare
SUSE L3 Support

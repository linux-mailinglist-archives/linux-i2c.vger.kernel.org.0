Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E0F95AE9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 11:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfHTJXs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 20 Aug 2019 05:23:48 -0400
Received: from enpas.org ([46.38.239.100]:39198 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729510AbfHTJXs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Aug 2019 05:23:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 1B005FFDB4;
        Tue, 20 Aug 2019 09:23:46 +0000 (UTC)
Date:   Tue, 20 Aug 2019 11:23:45 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMuHMdU=18qtZi7N8+i9cJbKVL+pOB-wttnRRu_mOcMNymF_3w@mail.gmail.com>
References: <20190819121618.16557-1-max@enpas.org> <CAMuHMdU=18qtZi7N8+i9cJbKVL+pOB-wttnRRu_mOcMNymF_3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH v5 1/3] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux I2C <linux-i2c@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From:   Max <max@enpas.org>
Message-ID: <3F017C0B-44D6-4E63-A908-DDAA5586D67C@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On August 20, 2019 11:08:00 AM GMT+02:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> +       int val = z_readb(address);
>> +
>> +       return val;
>
>return z_readb(address);

Argh, that slipped through the cracks. I'll mend it later. Thank you.

Max

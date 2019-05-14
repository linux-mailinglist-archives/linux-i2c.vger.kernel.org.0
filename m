Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90EC71D090
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2019 22:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbfENUZp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 May 2019 16:25:45 -0400
Received: from mx.0dd.nl ([5.2.79.48]:48406 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbfENUZp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 May 2019 16:25:45 -0400
X-Greylist: delayed 516 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 May 2019 16:25:44 EDT
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id 1435E5FE1C;
        Tue, 14 May 2019 22:17:08 +0200 (CEST)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key; secure) header.d=vdorst.com header.i=@vdorst.com header.b="lyYv9cZE";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id CEFC61A92E2D;
        Tue, 14 May 2019 22:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com CEFC61A92E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1557865027;
        bh=ph/cfyZvJX84dLFWtvOoqwfCWQcPYdXd6Vt/9T0LVrY=;
        h=Date:From:To:Cc:Subject:From;
        b=lyYv9cZEStmZV0va+IZj3unPfTfWk+3jOh7csKkIAp0QjhdCcbANa9Hf/h42UsYP5
         2Ey44ak3dEoQDL7Ymkwq4NIp+rby/7NB+CSZKhDyCZKZFjkHV15y7MXGGDxgVFpNCL
         ij5a7zuQZEGAH4mfW8AN9cOtAKA9i5tyPG4CPuthXN1RQNYc6NEh5TO+i63ibZv0nh
         nklcQ9dyVzd2tubRf52A9FmCwHhXWwdbYM7oo86MOWI2ThAvA/vkj/h+8R/mzmwqrA
         GQVmoTQVVH95bV0AUnMapB1Q8WjMlGaH6gBi/wo9ymzvGVgszESa3rU7Gw0KOCzQYb
         205YDA6D+vYdg==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Tue, 14 May 2019 20:17:07 +0000
Date:   Tue, 14 May 2019 20:17:07 +0000
Message-ID: <20190514201707.Horde.U89D9pGdUCpiYMizuoPLBJS@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, Steven Liu <steven_liu@mediatek.com>,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C
 driver
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Stefan Roese <sr@denx.de>:

> This patch adds a driver for the I2C controller found on the MediaTek
> MT7621/7628/7688 SoC's. The base version of this driver was done by
> Steven Liu (according to the copyright and MODULE_AUTHOR lines). It
> can be found in the OpenWRT repositories (v4.14 at the time I looked).
>
> The base driver had many issues, which are disccussed here:
>
> https://en.forum.labs.mediatek.com/t/openwrt-15-05-loads-non-working-i2c-kernel-module-for-mt7688/1286/3
>
> 1From this link an enhanced driver version (complete rewrite, mayor
> changes: support clock stretching, repeated start, ACK handling and
> unlimited message length) from Jan Breuer can be found here:
>
> https://gist.github.com/j123b567/9b555b635c2b4069d716b24198546954
>
> This patch now adds this enhanced I2C driver to mainline.
>
> Changes by Stefan Roese for upstreaming:
> - Add devicetree bindings
> - checkpatch clean
> - Use module_platform_driver()
> - Minor cosmetic enhancements
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Steven Liu <steven_liu@mediatek.com>
> Cc: Jan Breuer <jan.breuer@jaybee.cz>
> Cc: John Crispin <john@phrozen.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v2:
> - Configure I2C controller to open-drain instead of push-pull, as
> noticed and suggested by Jan (misleading bit description)
>
Hi Stefan,

I am using the openwrt version for a while on my Ubiquity ER-X-SFP  
router on top of the net-next tree.
But I was unable to readout the SFP module because i2c message size  
limit of 64 bytes.
Without additional patches my console was spamming me with -EOPNOTSUPP  
because SFP code tries to read +90 bytes in one go.

With this driver the sfp code can readout the module successfully.

Both the SFP module and the GPIO expander on the bus are working.

Tested-by: René van Dorst <opensource@vdorst.com>

Greats,

René



Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E87463AE1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 17:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243323AbhK3QFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 11:05:25 -0500
Received: from vps.xff.cz ([195.181.215.36]:52618 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239833AbhK3QFX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Nov 2021 11:05:23 -0500
X-Greylist: delayed 439 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Nov 2021 11:05:23 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1638287684; bh=Bt8TsQsfm9hCyCEvynPEZD/qLlYwuHKwqHtrdOoZu6E=;
        h=Date:From:To:Subject:X-My-GPG-KeyId:References:From;
        b=d2QEBY5Ao71Bg9wh60cU4Mv2soCzaVEPXrpDULM3JD2HOcrmqoqDBKqeixB48Hbpw
         1KneMzUHUDkb82sBUIMKI43cII8J90ZH292Lt2Mb//oxDS+1mJzAtap+C1Kr7fHDf7
         t2ZC/6e9IHvK+Yr0Zif82Lk14WdHtJPX+3cTieAw=
Date:   Tue, 30 Nov 2021 16:54:43 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Wolfram Sang <wsa@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] i2c: rk3x: Handle a spurious start completion
 interrupt flag
Message-ID: <20211130155443.sbvpirzj6moikxl2@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Wolfram Sang <wsa@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210924111528.2924251-1-megous@megous.com>
 <YaSfZxtYtV+SfJqL@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaSfZxtYtV+SfJqL@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 29, 2021 at 10:37:43AM +0100, Wolfram Sang wrote:
> 
> > This causes I2C transfer being aborted in polled mode from a stop completion
> > handler:
> 
> I wonder why this only happens in polling mode? The question behind that
> is: is it really a spurious irq from the HW or is it maybe a race in the
> driver? Because polling uses the same interrupt handler but just
> periodically polls it.

Spurious interupt happens in both modes.

Abort only happens in polled mode, becase polling executes the irq handler
before the stop condition interrupt fires. In that case rk3x_i2c_irq will
execute rk3x_i2c_handle_stop, which will terminate the transfer, becasuse
it's executed without STOP completion interrupt flag being set.

In interrupt mode, the interrupt handler alwyas executes after the stop
condition, so the spurious START interrupt is ignored in this case.

kind regards,
	o.

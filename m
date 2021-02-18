Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7205C31ED01
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbhBRRMX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:12:23 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:12056 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhBRQOY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 11:14:24 -0500
X-Greylist: delayed 361 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Feb 2021 11:14:22 EST
ARC-Seal: i=1; a=rsa-sha256; t=1613664221; cv=none;
        d=strato.com; s=strato-dkim-0002;
        b=Vr+bpIlbgwBOIeSYHrWF/w/qcu9diZESE0JHwH8xbOhTSTdZJcOVO/ovVzwUnAwSgf
        NhX0mWubNWnrxHDIH4T1J/lxkefqfz092bzAkL2uXRO/SQJp2QgudD2yo+JIn7sXZNSF
        zkjXQdyK75XXM/C5XHM3iehGJSFmeg8qVwb1u9NDP7DofCqZ1PLZfT4M//HECGH2Dovs
        FkgmzJBk1in2kkCJPXe9sp2hCeuobZ6ll63YvB/erRJ+sVgUosVEBGMIykS1O5vpB0NG
        sUHyTbD5o3EYZ9X8NKmPN5nnBooH4UIa5/4TAVGXi3DOAKX1PPAGXLYU7UQkPim+WOcN
        UT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1613664221;
        s=strato-dkim-0002; d=strato.com;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
        From:Subject:Sender;
        bh=dCcA+4UHDcZxfpa3Qd2giWQkgzUPwwUvFkfdkUk+cgY=;
        b=DnDicTjdJT3bpA6orFMkwNnh+9ulKCNJyZune+kp7erFAYWvKcwfJ7QZGdrnhHejHj
        nfXaIJzblvOB2IbMs7hDayAOfh65jLAvmLxIovoM/82is5pS42B/oUGfXqa0PZ83v+Tf
        wb7XZuDPQ4DrOULMU154bkZJFOCnn/GczTK+HD5VBcD2ZfY3mnJv5lQd2B3GXIV0bk14
        UgiB/S9kTjdzdKUI1QAgDbrQ5v2iZx8g52ur161pt28JJAyHAyRJA4DeZBCwlOgZVUSc
        8p6vYuTfP/n6/UzF3AphWrWuMDrHYLCcvc51WfX8UlOEOtmi66V+NDfGaaSeA2l4NuFl
        lCLQ==
ARC-Authentication-Results: i=1; strato.com;
        dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1613664221;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
        From:Subject:Sender;
        bh=dCcA+4UHDcZxfpa3Qd2giWQkgzUPwwUvFkfdkUk+cgY=;
        b=iHJA/8Y6LuJVOLofRabjqcVYmGlMpyNT8TABoHcIH33zAKXu2oB4Osnn2+ehuTrnH/
        +YqBb1DvmbqQ3AeKzw0bBu0CLWy1gf6L71baKFHrOK+izIWnYmeTu4BsXEEDCSkjqLae
        uQAWvrsisY9ZFNSAq71J+/woQwln2kXBSsWkefBkB3q9UIO92qVeNz4+FO9NdJ09axxj
        23T7nvLFoeC0UGugan37aBOZtN/i+PqmYCuQJnkrHtLvdGzP9Q1rdVEE8oE1jMMHSFkp
        HqOP5b8y9XN3iGVUU6j9pqIszc4N5nkL+LTe+Dd7UrlpjJPNVhDROfJ/70n01LxLlJMb
        7viQ==
Authentication-Results: strato.com;
        dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2qthug="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.18.0 AUTH)
        with ESMTPSA id 20675ex1IG3f35x
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 18 Feb 2021 17:03:41 +0100 (CET)
Date:   Thu, 18 Feb 2021 17:03:41 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org
Message-ID: <1817984199.148366.1613664221431@webmail.strato.com>
In-Reply-To: <20210218104936.GA890@ninjato>
References: <20210212164541.8986-1-uli+renesas@fpond.eu>
 <20210218104936.GA890@ninjato>
Subject: Re: [PATCH] i2c: rcar: implement atomic transfers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev18
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On 02/18/2021 11:49 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Implements atomic transfers. Tested by rebooting an r8a7790 Lager board
> > after connecting the i2c-rcar controller to the PMIC in
> > arch/arm/boot/dts/r8a7790-lager.dts like so:
> > 
> > 		compatible = "i2c-demux-pinctrl";
> > 		pinctrl-names = "default";
> > 		pinctrl-0 = <&pmic_irq_pins>;
> > -		i2c-parent = <&iic3>, <&i2c3>;
> > +		i2c-parent = <&i2c3>, <&iic3>;
> > 		i2c-bus-name = "i2c-pwr";
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> 
> Doesn't apply against 5.11 or i2c/for-next. What is the base here?

renesas-drivers-2021-02-09-v5.11-rc7

CU
Uli

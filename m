Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0D27A2E5E
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 09:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238006AbjIPHQd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Sep 2023 03:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239018AbjIPHQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Sep 2023 03:16:23 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857021BEC
        for <linux-i2c@vger.kernel.org>; Sat, 16 Sep 2023 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=BmfF
        l2SC+D+xgefkLw3XFWBhlaLj9X0bxXdeqbL18Hw=; b=h/rqGk0Sbvg232NA9MAc
        2WQn93C9e9zhZs41iVsFTHXl3XTSVNB60BZGxUi1kBohmzvy4aZ/6i7PTciVlwa+
        +K6BIpFP6JfTByM/HDgTLBp73wvggP9G1OSCtcO1WL7JEErWooApnwbUCNqljzCK
        LaKwOHuL6RETPCLOT0C31by20sQmqxSyoZtFC2xbnpfUXEmVrulxIr0n0NzXhdVd
        GfY/9ZQ4mIrLJe6IA1nN2wkJuFEx6+yn9lG5mvuFsLReg4FPIDdb8sb6WRBZBXFK
        bj9muCd9PzYpVe9RRG/MO7a9yYXxYI73Ab9VQjRi2loLCTWzwlufDDk2XWeNnnaf
        gA==
Received: (qmail 1558226 invoked from network); 16 Sep 2023 09:15:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2023 09:15:58 +0200
X-UD-Smtp-Session: l3s3148p1@urQ7rnQFFEsuciNa
Date:   Sat, 16 Sep 2023 09:15:55 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: rcar: add support for Gen4 devices
Message-ID: <ZQVWK9Q2YtbehvjW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
 <TYBPR01MB5341A56291AFCB54E4918167D8F7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xUMUwyrLf7FPccL/"
Content-Disposition: inline
In-Reply-To: <TYBPR01MB5341A56291AFCB54E4918167D8F7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xUMUwyrLf7FPccL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

> I tested the branch on the Spider, and then the i2c cannot be probed with the following errors:
> -----
> # dmesg | grep i2c
> [    1.528773] i2c_dev: i2c /dev entries driver
> [    1.533572] i2c-rcar e6500000.i2c: clk 395647/400000(133333333), round 46, CDF: 6 SMD 20 SCL gran 27

These values look good and match the values from Falcon.

> [    1.554646] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
> [    1.561487] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
> [    1.568133] i2c-rcar e6500000.i2c: request_channel failed for rx (-517)

-EPROBE_DEFER when requesting the DMA channel? This is weird, at first
glimpse this seems unrelated to my series. But you say v6.6-rc1 works
fine. Strange.

> I checked that the v6.6-rc1 (commit 0bb80ecc33a8) could worked correctly.
> JFYI, I pasted whole log at the end of this email. Should I do git bisect to find
> a bad commit on the branch?

Very kind of you but I think this is not needed. There is a Spider in
Kieran's lab and I will try to reproduce the issue there myself. If that
doesn't work, I'll come back to you.

Thank you for the report!

All the best,

   Wolfram


--xUMUwyrLf7FPccL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUFVigACgkQFA3kzBSg
KbYTZw/9EpX4Kk1xswDtEcyK0bowR+TyKJ18FVDF0sKeXIENFY/qkbdrguS0cX+U
7iU6vAlaz+5HQ9w2Wa0cboMz6sM3QKsO4q68Ae6R96W+c7Uyg3d2ZaOVpCL8qf9j
L8pcwAM7AGtGNbE40lD1eYr/iLj26FH0tfinB53nn9oWT10FiyECIuZ+UzmsgYmD
WSgruHhTCNpJ/++WcWSRzxRyFVaMHASli/WjHiJbjkzfIp+cZHCUtcElw/hCVaZA
abW2He9IXE7cqXgj9nwAjzXiTObsgduknTaEIbHJaRY1TvX+EaHywQntharQTPa9
UkOkKKmWhH35hP8u6n/rYcBOOItxdVlpYlSP/xgjsgDZEO6M8leMaXj8DUCM0Pmn
UL+PaeEnItc1kwaqa85qRRhnMSE0x7kg0Tg0iRB/W3NlL+ym0+xE37Tma+QL+sef
06RjU1/4nDwv4/uMWWLXkjJ9laznrI06k14X//AnaU1fWF45dg7nfHTUT6b/n1mC
G2J0MCXC7vp6EPQQ5fPk7bFU+awpp2v2baRPNtHOIoweurSxHvVmZyf9Gn1brL+/
oHVIJaeBxDZdlfq4dXmextrpYew90FxeWP0/SsdRfoZs/uIuX92pxBYNzNfk5F6i
4aK2hwLYmqLB5etCG/pRtDV3ma3ZgxdsUtMP1bw97SLgHp1ff9s=
=s0l4
-----END PGP SIGNATURE-----

--xUMUwyrLf7FPccL/--

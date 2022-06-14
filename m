Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32F154AB7B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 10:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355597AbiFNIMO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 04:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355547AbiFNIL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 04:11:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7F83D1D4
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 01:11:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B524B80D3D
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 08:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C07C3411B;
        Tue, 14 Jun 2022 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655194314;
        bh=7cn/ewXNhrh34ihS5rtM6rfogUOCwWOkl9iHCWb4h+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q8SPTRxrU0umNRBrQ8ghhpTzOQsrsNREdqnMvYvW8TszPSWrD9IV0PojeJoUcrsJ/
         GAR57pJ0Za3cA5PlN9Co953vnowSnhaB49FMCRfp3qR0Wlpy9CobFvPxj7TWdNiuPp
         5teXZH9dttcc8RE5QpDF7wYlGYlSN/kG2mOHJc+naASxtBgi4EE/AkIA6ZbT5CGJ/a
         vQlt8mFcaHWpk2Uioz9aQcRhpYuZcjMXH1wCFPeKPRr7Z2pBl/qKpaWuoYsCETjO2f
         z5m9w3s5U36Hx01WhNRD9zsuRNZkxs/odRw1WXSzOoRETOkhJTUrrayASCCczf0oxi
         v3r+fryq/CJGQ==
Date:   Tue, 14 Jun 2022 10:11:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, git@xilinx.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Message-ID: <YqhCvJdWw+g9ZZFL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, git@xilinx.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
 <YqdPtexPiukMlUcG@shikoro>
 <36da7a53-9bb4-26ae-0ac5-1ebcdf0ac695@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FJmf8GTDlnDkRM4l"
Content-Disposition: inline
In-Reply-To: <36da7a53-9bb4-26ae-0ac5-1ebcdf0ac695@xilinx.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FJmf8GTDlnDkRM4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Actually this was recommended by Greg in one of our thread here.
> https://lore.kernel.org/all/20200318125003.GA2727094@kroah.com/

It is in the C standard, so any compiler not adhering to it has a bug.
It is especially not important here because we use the enums only
locally and do not export.

> That's why we started to initialize all values in enums in our code.
> It shouldn't be really any problem to do so.

It may be more readable if you have dozens of them, but it also adds the
possibility of copy&paste errors.

I think I'll take V3 here.


--FJmf8GTDlnDkRM4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKoQrkACgkQFA3kzBSg
KbZkCg//anxE0d7mr47DU42yW2oPhJo+k8NstktMFmB7jnXfLIs8CJy4kOmdwkwa
lBmJPax7pDUEjTofAMq8nRRgTjGbYyhgm/ngUAdNaXbNb9q0tnUyojDH1cal9KD7
U9Cv6R13ebp+Ler5gRqo6ylA2xio4zlF+QEh7uCcJRd5T6iZGdPjIbx6JEHYj12+
GW7Re+DbdFQo2BUetpMiYzC0ayNUi9LBGVhNGfaYYGolXz9kICCYv7pUL0f+DXOq
Dnh5n5fHDw+BKG33p8BL6J5v7shYuYzOeRJ0vDznsI9UYEcF+XnS3GJeauCW6Jh4
wW/q1tf2sQ9RcW4fwXLmwWLKuM3JiOUKtkyUi3VkHba+r5iIXb0/t/wDH4X1HBom
jxtwu0yVFWIPE4H+a5v8Dt61lBiEA1fKjDbEzZzp80GJAO6jnWG8MqZxPgLbqtBe
jk9YFW1wUSOzIF752b8ycDnneRhJmj5d/2VKbMv0GR6jd3hk4/ZwxvPNFlxObhJJ
YnaqtiRqKFtxHSNCQuEar6fal/HI+yMKBxMJMLJXXkXn1oWGKHJ/BLfXlt2Ixo6Y
vhqcZ/tpHZASOJd16AdCr67rPlWbaV39EeEcPpfHCTlz/5zzuH6bZMPs5rj5R0M2
YSiTZT8sNzHNNpVkLm8IYOKgXYOiQlR46lhn9BjZGaaPYu377ug=
=PUZk
-----END PGP SIGNATURE-----

--FJmf8GTDlnDkRM4l--

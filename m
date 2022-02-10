Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CC24B17E2
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 23:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344764AbiBJWCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 17:02:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236817AbiBJWCD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 17:02:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A59EBBC;
        Thu, 10 Feb 2022 14:02:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC44361BCD;
        Thu, 10 Feb 2022 22:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94026C340ED;
        Thu, 10 Feb 2022 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644530522;
        bh=FuA/vqugt280wWCxhxZPTSLe70pjFP3XNTWK4mjkZK8=;
        h=Date:From:To:Cc:Subject:From;
        b=SpDKy7QRhMlA9bXNKBRu4KtjJa8jIRmRvxhf6VP1avsbU6/DPJu0u5/CeMZvmV9QW
         bf5IY4iX+2nnDvIyjJNDc/qBgA0oP8PpizL06ElHs4DKXrTNaczpA8efdh0EW+Jrb5
         6SRtWtj2Edaq+H7SGjL8VXIEUcY2yqiY56gE766rVJFxuYumV+iGvUlRwSBqJ4ZyQr
         zhMWHZr+Uz76Mm7XbupcxyrXAqxyZp/tpl1KG/9pF8+uwj9bB87ix6AoPWUkHlz3qW
         RbrwCYC5ipYPzPDsUhrwpmCEmEGNPLAIG2j+s/MQwjrEgTKr0TPQBjvKN1RpR3ZC6p
         zMx989cHvwN0Q==
Date:   Thu, 10 Feb 2022 23:01:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PULL REQUEST] immutable branch
 "i2c/add-request_mem_region_muxed-20220210"
Message-ID: <YgWLVmSsav7XULiC@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="upvdmhasOsfGQAmT"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--upvdmhasOsfGQAmT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Guenter, Wim

here are the ioport changes needed for the WDT series by Terry Bowman.
Please pull them into your branch.

Thanks,

   Wolfram


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/add-request_mem_region_muxed

for you to fetch changes up to 27c196c7b73cb70bbed3a9df46563bab60e63415:

  kernel/resource: Introduce request_mem_region_muxed() (2022-02-10 22:40:00 +0100)

----------------------------------------------------------------
Terry Bowman (1):
      kernel/resource: Introduce request_mem_region_muxed()


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) kernel/resource: Introduce request_mem_region_muxed()

 include/linux/ioport.h | 2 ++
 1 file changed, 2 insertions(+)

--upvdmhasOsfGQAmT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIFi1YACgkQFA3kzBSg
KbZROBAAo05toUcrtIJud8wqybjTg4u6VcLsPHYNmXwQrIL6630BeyYEWsMbN/0n
inXhBriOTRq21Rjb5XQk0ftXVKZPiZiutHAHi75XD7VqpSo23BE3wPZ/WK4r8NcT
nOTXojj8ISEfDwEr1ZTUNL1oZBoH6/9mnx6ZmYFTqcCAxN/jCOy6oMCxDjSuVA33
LguH97rDUYZbqTLlcq+MJZlpd6ep+v362gAPsTawPrIi/C1aSUqDMqInWHRwJD2L
TwroPT0Sq6QFmV9zCqwzSGD7cVWybYgo3+5MfdhEeEJZewPhxw1L/U2IxIhXvREc
EQ3FlEr5Zp9exsaVhmap3ToL2RMHCaIvKhx0cbIB5BTSgRakp7DiRK9SJScVljFe
Fev3HejCcXXa31v8OflMdaKnTJxjH4WhOgPgKool0tAsXBR/vJ/kv+Sl+O8R2Yrj
+MlwxRr3JV3X3IMkl3OJycyo7fLdnXI+oEAZx9LfzppTYic2qrGft4VrZPP/JTxu
rx2qhRuUtSe7YraJrq0cCmanWwuRfdnP+mzTBlKTOLK6u6EOYFSVwrGc7D4Rdvwd
6kPlwg33zOHc4P/GabxOuMqiFODirirzwDy+FQxrw4h3jChG1kACWxZD34nV0uv6
4m1+dUExWETsFHcYBPUYpfdatd5OvNOcD+RTu4lgtJuhW9lVx2k=
=pTXp
-----END PGP SIGNATURE-----

--upvdmhasOsfGQAmT--

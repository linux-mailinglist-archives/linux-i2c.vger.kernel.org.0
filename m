Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65635907AE
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236171AbiHKVDo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiHKVDk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:03:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7055C95E62;
        Thu, 11 Aug 2022 14:03:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E36D861387;
        Thu, 11 Aug 2022 21:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCF6C433C1;
        Thu, 11 Aug 2022 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660251818;
        bh=DqZcGDQnWzKqa+ZcFIEEitS40tBZWe72ieH30nM3oeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kOUlM+tiWDVF9Y3rB/TokCyrbTe6EEhsWvYfQ7wzDL22jLkHg9sZH1zUEoBb9PCU8
         YNYnX8Q8eHQxL/BSZX6IXP/VT8xrx3bFq3cwXTP3dXEeWyuSn5CrmXlOkK+8GEtc7R
         /s3g/86voNICgU6aNVXOI6ydH10CCOyKwhSj0prxIRYrxPiAimnRRs9myt4fuqgnwP
         o0fKk5DE43C1t6H9cem/beV8Ed9t7mqKuKDCXtk07n3EzHmDhnmEPoP2r+L8lya9Bh
         FGNaoFHXExp9bkgqKy0pWruRDKCsZ48dgB9TFdQQyucC86F6lJg5TMzbOaA9m0FF3a
         Otn0BDsfPB3hw==
Date:   Thu, 11 Aug 2022 23:03:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] docs: i2c: i2c-protocol: update introductory
 paragraph
Message-ID: <YvVupvQOKsPoIQww@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uW2Kpmrpl4CvCdf8"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-2-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uW2Kpmrpl4CvCdf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:00PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> This sentence dates back to the pre-git era and it does not look very
> prefessional... As there is no clear definition of "finished", and given
> this page is already a pretty good overview, not to mention it is not the
> kernel responsibility to document the protocol in detail, let's update the
> text accordingly.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to for-current, thanks!


--uW2Kpmrpl4CvCdf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1bqYACgkQFA3kzBSg
KbbGlw/+J0cpJnYM4ob1tyQt5RMUtturBqg6DJN00oheAlaGI4Hrw0aJ0QIClOHh
IHUhT97H1AGTBNTLXbsKAyCtQ9Paf5uP3ZehMX9L8k0NYbbxuqSKtBgYHo9GugDU
20Cx0Zdcqc6o7nrAVF9ut92I7QDFCQQgZwCasjey6qPqaFJut7nEf7EPdMHWdFd0
s282Wgf2bAmVcuBav34jEx8+nGcXBI4ELCM8XHj1FLBJrb5KTjBh7CCh/q29J0hX
cr2cUGFGVkh472z5/GTQiEXn0iF3d3SYC5bIvMiy5iIQoudzi2XLuwvqC9K9iXph
HswVUoqXj4CVe8+19cIay5Kpyx6gLpby0I6S+mYzz/mS3zSR8NuGV55F/A0b5tVD
nsF+zYu12OOT1X9mlZHQisYGbqVes6rnARsI3fm8Cfb2UL4bYGD9Rgzk2DoKTggY
CxaZAjJLXOswhfI/+ibqmt0OogZq/W2KML0LVf2YR2YjEUQ/RNBPV8FaYgA/VtKZ
NDceOqJotDVjlFsTyTCKpBHQurwgbfi/FsjbkOey711F4Bh3/zRYwd/iOgRH1x/Z
CDsDZHTCgHVcAf/DX2dW9+/UdarEuDpJvsdo44zzM+LyMzFyhHoiMq1RLJ7F2aEs
jECS1jiN9cfoO+1lAc312RxyrWaMdgK+qse7178MdmGJ0CcRU4o=
=NpZb
-----END PGP SIGNATURE-----

--uW2Kpmrpl4CvCdf8--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6026D58C310
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 07:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbiHHFy3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 01:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbiHHFy1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 01:54:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21A11002;
        Sun,  7 Aug 2022 22:54:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9D443B80DD4;
        Mon,  8 Aug 2022 05:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FD7C433C1;
        Mon,  8 Aug 2022 05:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659938064;
        bh=fdGOCwmBEK9CWaxIAUwPDifSkxj7PaxAllZU82W3Ry4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QDZCAORd+CDcOLkVaf1UPrSE3hL4ymPfTAuq2qSfODI7WxCqUcSnMbh3DtyhlFmJv
         7SevWPkePl6NqhsK3RYndm1t2fn+fbAom30UPqa0cR2amyetfoRRWdGx3CXGiYHDZt
         Of7afz3KYKWFNMpBPluGeh5layWLYJjc5TrLg/hYiVSPzaKx/phIj8DYFxCEetS+oo
         VPrPWivn++E8p3/wtNdfSWjzbrNpsPym6oOUjOxkAaODCg0y8DOZiS8eb0oXiG0/zS
         mkb3Gcc7zQP6MSKndbsDnnz9oUxVJbMYhXXwdUWBULqeM/HcNnDV8ZG1umR+7Q9Piu
         gsv6IZjnMR64A==
Date:   Mon, 8 Aug 2022 07:54:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Robin Reckmann <robin.reckmann@googlemail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Message-ID: <YvClCC4ArBEjQJl9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Robin Reckmann <robin.reckmann@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XD4kyBoxfGtTDMuX"
Content-Disposition: inline
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XD4kyBoxfGtTDMuX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 07, 2022 at 11:04:54PM +0900, Robin Reckmann wrote:
> Fix i2c transfers using GPI DMA mode for all message types that do not set
> the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").
>=20
> In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
> and it has to synced back to the message after the transfer is done.
>=20
> Add missing assignment of dma buffer in geni_i2c_gpi().
>=20
> Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
> ensure the sync-back of this dma buffer to the message.
>=20
> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>

Thank you! What would be a Fixes tag for this?


--XD4kyBoxfGtTDMuX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLwpQQACgkQFA3kzBSg
KbYMhRAArxGcGhOSEP/LoXFsoUt62gmN7SUbYALnShNEsiAAsIyfcDokRbSxVfPk
hoe7hFLjoEL+ZcARfiqvYWGbTpX6dlFx3TUdkkVkL6oyCJ/YcfvgFat7FwV0cNyP
ce2soTTDV0gDRecDLRald5RA50fdPcvcUpEhrwJDb/2JjffKXhJs4rlCOfHVUNXt
QbVwJVj54xgMeCmLrN6FsR14lTzQ5m+CnbHeDJCrKPFIxAIVIWwXvSU6lhucNYCo
lFn0Q4ZDdOnBEy2miNvvdPT0BEKxplT4SgJpD3zGjxGnFSIbO0w8kdZLvfioCrA0
s5gQxVZpHxtLtKtQruAgX8r2+JW1zSSxG8aicdX9QgNABybcYfHV4tH/CJikDLMb
VTPc8qi0HtPLMnBribfmECcHaeLzEe38gtb7aGDUG4z8wXZgePXRGfnqLtCDGykg
4Vomw99Ugc/1+XwwrpUr0JLBYqVPXq2veOsirnGo0OR3iJGajMZw4y9Tlct9AQZZ
IL7lfPhTlO2WS2rVfURyOXZCUg1/tax/RgDfzFvjJesvy9+hpZ/pq9Csl+k1b+GZ
8lbslOpKD0bM/WLDWYbrel6IH/openjxQ7M5UNusGNAnEmZPpm5QMfxsa3tjQEm7
Tv2AXDVrVjdsK4dpcqarPjowL/IJ2I8CntN4+KefRLE0ZOhthtU=
=HpON
-----END PGP SIGNATURE-----

--XD4kyBoxfGtTDMuX--

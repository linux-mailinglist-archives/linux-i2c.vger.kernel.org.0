Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBAA55F5A68
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 21:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiJETKC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 15:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiJETKB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 15:10:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37261573D;
        Wed,  5 Oct 2022 12:09:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 94160B81DE9;
        Wed,  5 Oct 2022 19:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5737C433D6;
        Wed,  5 Oct 2022 19:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996997;
        bh=rif6LFcwSyRh4qhZHGPFFyAdxsWF701RgqZ+7dX3GNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=epYxwo3sSykNF4QqCJDwab2YkY46nyiSsHYbtN0Zz99okOsPUMDW1vnX5pp92hhHA
         RkqSJC8KMs4w4Z63q36SFDMKc+oEvQF7F8vAmfhGbqg4OHX8sTDzXjYuh2P39V5vq2
         zuPihWHiIhhLBkV/tAqNXsgOUaAAzaqFn+O2BVOxuOc44H4bYHyLyw4YKuuwgk961v
         fO0CpG/Fd44bPIRYkBts4uSGLoN/qF9NYw5etav3YXLjVTSLq3Kz3/9tX3Mx09h4Wc
         QuBBMyTs+nSpiQQbxOrrBys4UDZQ57OB1ZDSLwvxB0iqrtTE/NvbISn/lxzYTifBK9
         HXzBWsRHRorPQ==
Date:   Wed, 5 Oct 2022 21:09:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v4] i2c: hisi: Add support to get clock frequency
 from clock property
Message-ID: <Yz3WgHgv/O/0o5fZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220929071547.135913-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KmxCTc2+Z+Tym3hS"
Content-Disposition: inline
In-Reply-To: <20220929071547.135913-1-chenweilong@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KmxCTc2+Z+Tym3hS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 03:15:47PM +0800, Weilong Chen wrote:
> The clk_rate attribute is not generic device tree bindings for I2C
> busses described in Documentation/devicetree/bindings/i2c/i2c.txt.
> It can be managed by clock binding.
>=20
> Support the driver to obtain clock information by clk_rate or
> clock property. Find clock first, if not, fall back to clk_rate.
>=20
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> Acked-by: Yicong Yang <yangyicong@hisilicon.com>

Applied to for-current, thanks!


--KmxCTc2+Z+Tym3hS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM91oAACgkQFA3kzBSg
KbbRmA//VBlFWpimPLd+0v1exG1pQwvdGnMclCZlpRRwBTVGg0FmeRsGM2QTZ6lT
/FPmNq3T1RZ+zg5LOBceAnTuf3tNmtz40RtQteWZR4Hw6tz4mAiHH1AY9KI8sZhy
orW5GkZtXBLNdiu/9X/LgJp+6c5eXjj0hCQOXRmOkKCNn9kKhMsmV5aRyJUM0baO
iMx2AKs02fOzj0PWLYAw5IkRTbdghEOc/m+7SfiOvq51Lm1XeuY0DtYUaOymdlLq
qAaP78UH1zCxSRxuVeat547L+Hcg6GCWV3GENbfzj11fL8MevnpJq3+1oj4Z6nYE
kCqvBcOYc9ZkwpurI4CaJ0WtPzLaDEzmbRBRVpQMSOdqkWGYHN8MlC65NCg0Gzft
r4DiJ42GQnGbwkUC2F5xfguXk9USDFZ/AK00oGSpWXXGWNdmu8aY0YtiFnw/r3jB
kK5ugQbkBMKSsZGy5DnuM/tXfmKt8Ku1J0z8BFzaBesbI/b/y4mtwJZy0k8XgYtO
BapN0e9EPs5WUImPj1fysFvUpjk4pX0+1gvPn+IySu1ZmLXFXALBOAKx9l0lppsU
ZVrPk9qmcYXaasRLg5+e3lYncPvlxNHW8aQE8lKypmORTUJ8F6Ggyy8iqUZCsE3u
nmyTgyKoM84LD71thgct2YNL3HjEY5O09OUL7FP93o4RlsAY/I4=
=X269
-----END PGP SIGNATURE-----

--KmxCTc2+Z+Tym3hS--

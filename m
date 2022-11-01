Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3E1614ADA
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbiKAMiw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiKAMiq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:38:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD226176;
        Tue,  1 Nov 2022 05:38:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27EF660FDD;
        Tue,  1 Nov 2022 12:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6280C433D6;
        Tue,  1 Nov 2022 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306319;
        bh=se6PG2xHeBPqFkNFsuNeXuULlCqeC7FXT+FfHXfg8Yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pZklbzRQghCxF8BOSDSLxXgT4nKxCsMVDKxPUvO29Xf84wCYaQeDffMMv/4GwYVhB
         IP4co8teD3c1us8wwuSDNHo+7yCQB290oe4aVQz/XLVM0IquG+5lMXlvAt7+YFzXpE
         p0Jv9yTLFPIrU+ZkTRDQHBFhwXZikdRGwNybm4I85iwPqZOITh9UPSG6xTimtggtV3
         ZqDsd5WAqSVN0iXG0HrOX0pSaswTf5uYUhcolVrme4BfBPvLvRvAcnSKoCNBWjs9/Q
         AxxIHpRco4XINbqqi4MBlsqJ00PboIB6BjW7GxzFgCv8VVChRzbq6FdfoDCmlCiT0B
         vaIZUJsnHVlvw==
Date:   Tue, 1 Nov 2022 13:38:36 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] i2c: tegra: Allocate DMA memory for DMA engine
Message-ID: <Y2ETTIxyR3xaBWXT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
References: <20221020143933.1951609-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C6Vxh2k7p66XcGxr"
Content-Disposition: inline
In-Reply-To: <20221020143933.1951609-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C6Vxh2k7p66XcGxr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 04:39:33PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> When the I2C controllers are running in DMA mode, it is the DMA engine
> that performs the memory accesses rather than the I2C controller. Pass
> the DMA engine's struct device pointer to the DMA API to make sure the
> correct DMA operations are used.
>=20
> This fixes an issue where the DMA engine's SMMU stream ID needs to be
> misleadingly set for the I2C controllers in device tree.
>=20
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied to for-current, so you can work on the next steps on top of this
soon. Thanks!


--C6Vxh2k7p66XcGxr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhE0wACgkQFA3kzBSg
KbYItQ/7B+AJktGvlKXEN7Sjst/MNWBTQuxkGjYUMtRw9HYV5kfzLaCYwzHuKDWw
ZL9S3G2OWUvGGI0d5KqFjJ19nxZE1jHXvjfwbwkiDuBo4qh5l65aSNDcNGaQF6Ns
wgxY9bjCtw64BE7zibkUG1BJKU9lCk+Xcl98Mw6AZIVoso2Xk61j+WdAKRu9vJgX
gq0K8+VdaAfOZgWLnTGCriIRw/HkJ6YfcwjtiL0JdFprbvGz8aknFEN1GvHOeKLm
3QlAcomwc206+F/fnPm7PKaY8DnhzLTi0n2buPfHgNruwGmKb0KKtS6lTEaWOLrK
DYhj8wmi2LGj3UgjMXow9GQtkJu3NrlliTI/wt5CLcmkN1hZb2RX8W8bJnCQ2tk+
Zd8RDISOuIa8bTKH6GjdA11TQurAj5HjDZkkOjCIuQYwJpObVOrCQHRHNlSz8JHc
W3vuxZ2J0EfkDpUsQGqICdbKfor+SRWgP9Gv8oeqSa/r2pvF/KKOU23hD9+7g9ve
LWdX1qnOlTFsXvcJMaIOIhUHFHKQqDkTHFtcIXkfd+hKup0GAtTFnoCRE23VNSCz
LsKOGQRG0a5XCmkxfgBjCNJ+Ix6eTEgJTCb1hT7STbbDgAe0T4AAE3FuAhsaQGRy
ysuMvXn9lng5tMmP04L7L+uc9DGbtDt0RwSgefbLD+ZiFhWYoGI=
=r5Ua
-----END PGP SIGNATURE-----

--C6Vxh2k7p66XcGxr--

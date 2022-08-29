Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42855A554E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 22:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiH2UJT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 16:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiH2UJS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 16:09:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDC29108E
        for <linux-i2c@vger.kernel.org>; Mon, 29 Aug 2022 13:09:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C93F4B811F5
        for <linux-i2c@vger.kernel.org>; Mon, 29 Aug 2022 20:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0618C433D6;
        Mon, 29 Aug 2022 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661803755;
        bh=hMSg0YjI0qOiwvTDi40eSpgR6C3WChuLlVS3RhfxKuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Iesg9Ix/zOeMMMymcVFfDy6PzmilSdNGr1VpFP+lNYriwSIZ1/FqUf/WNMpv+QohL
         8uJjeGHznksglQFInkqJhdSBxNnLpTd0mFiTCch26JtaKTXeXiC76eH7+3okkwgW52
         TZb3CP46n6qSLMisk/61783JemMw5WK1k2vXg/fJF9MroQz25wghf4zvcBRyksdmSq
         pzZu62cbfUAqV1B/+JNPDjTlJVwciGtPn55BFNlFdrjEsCl59GhgawxrM+KJfLD51q
         syToxqw4NPGdSfZW9RDDAeXTLRTbxSlxWgtBHhWmAwpN+fWY0tLnxXWsXVhw6RXbzr
         4gyPmXfDiyOww==
Date:   Mon, 29 Aug 2022 22:09:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Bruce Duncan <bwduncan@gmail.com>, trivial@kernel.org
Subject: Re: [PATCH v2] docs: i2c: piix4: Fix typos, add markup, drop link
Message-ID: <Yw0c5K7mhRLTvUwZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bruce Duncan <bwduncan@gmail.com>, trivial@kernel.org
References: <20220825150141.1f5558c6@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="D2UrZrjwOS++vj7j"
Content-Disposition: inline
In-Reply-To: <20220825150141.1f5558c6@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--D2UrZrjwOS++vj7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2022 at 03:01:41PM +0200, Jean Delvare wrote:
> From: Bruce Duncan <bwduncan@gmail.com>
>=20
> [JD: Update the subject
>      One more typo fixed
>      Drop the link to lm-sensors' README, it's irrelevant]
>=20
> Signed-off-by: Bruce Duncan <bwduncan@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-current, thanks!


--D2UrZrjwOS++vj7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMNHOAACgkQFA3kzBSg
KbZaFxAAjMWbsSJMHOgDcsf1idTE46q3iFirMXDblkgBslNL0/yM4O83othao02N
rK2xYdRC7e3DfnrV8Xocxdn10MKbJXYu6ePYOjD+eb8FT3zUORKQ0NJ27xSX71Vx
4XBFTS+yFYUByAhZ/ivxSoO+Jzk+B95jQgN2udyIGbCRPZp68cljgr+tGwTaRtjG
Qw3XU9Kd6zP/JrhutyfEW2+2xg3elvQBLLNXb68dAB+EHI/xIuAh80WJLddHl9at
uTIJ9dk9j7/F9wOoMs3fuOH2kYn5Hc2BMSjfHwfX9Zk4/g2+f2WGGbfUNf6kQ7Ia
1jIEcBzBKV+S29d1KbmEMCDsmWPZQQ/vZ+gaks6mqS8ThxakKkjD7NEQNgWklUX/
zD38z9nz/tAxT2Jcy89MDzQhWBdk4A1FkO85sRxwZhpbkZZbnjIeXa0NCsJZC7tC
pGTNJ02tAB90jJWfO5LkiJBUSp0elZVIgbTeYvuUpAn+Tx5STtAcOvDhKrVEv/MG
H8rQK3HLALRFjqKvC1lZFRpk1CAZkUsOFfydb8Nh5E7V4vzzaQUSL71tEJcUr6ZN
zeiwxTHxJzQtyEJkTLGqn05e0WoZhrL9RI9Oo2rElE4DjTL9iza9a9VWpttS9yO/
Qcb7pW0INKK3VforfHVkjmap7mPfMIvMaCbWr7ktMzihlM/xjvQ=
=0SzM
-----END PGP SIGNATURE-----

--D2UrZrjwOS++vj7j--

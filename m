Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E690B2A97EC
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgKFOxL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:53:11 -0500
Received: from www.zeus03.de ([194.117.254.33]:58154 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727463AbgKFOxL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Jix7+UkWL/VrG69jTRheel56Z4hh
        Zp2WPMuNd0Y4grg=; b=xxspLpURMC/KHB8srgUp5ELiJUit8c40QwsDRsScWKSM
        Azj9fKPMeJOJNPrLug0jTAjYERDWheYZKrhMZM4tH8ExPKuxGOSe1bzH62DoIHst
        slBp8xZbtUnVxohCsAORt/bmOePLuEPE9xPW35f5uB0zaE3aksae1avlys6QRHI=
Received: (qmail 982426 invoked from network); 6 Nov 2020 15:53:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 15:53:09 +0100
X-UD-Smtp-Session: l3s3148p1@TQf3XnGzsKIgAwDPXxn+AAvEwmht7CYV
Date:   Fri, 6 Nov 2020 15:53:09 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 3/6] i2c: mlxbf: Remove unecessary wrapper
 functions
Message-ID: <20201106145309.GD1059@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>, linux-i2c@vger.kernel.org
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <e1d92125190a5846bae64f64168f48e642e2274d.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iVCmgExH7+hIHJ1A"
Content-Disposition: inline
In-Reply-To: <e1d92125190a5846bae64f64168f48e642e2274d.1604432921.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 02:54:40PM -0500, Khalil Blaiech wrote:
> Few wrapper functions are useless and can be inlined. So
> delete mlxbf_i2c_read() and mlxbf_i2c_write() and replace
> them with readl() and writel(), respectively. Also delete
> mlxbf_i2c_read_data() and mlxbf_i2c_write() and replace
> them with ioread32be() and iowrite32be(), respectively.
>=20
> Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueF=
ield SoC")
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>

Applied to for-current, thanks!


--iVCmgExH7+hIHJ1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lY1UACgkQFA3kzBSg
KbYSVhAAsE1vnWYediFnhspZM95aBR36I+LlGUdaRk6lZH5nAejt4+LLyq7aT2O5
Y8eUtnOYE9QEwbKMPJEuZbomZ3aFBqKu+hgyf8qPXzSrodZkdxj5d/nreWqP9MdM
+wCLHIYY8mbFIUTXDEpqAOoTVaeudQngYW/ZOqcj8SRe/Rbyg6VnAe8es7PyUI12
xioQjDCS9xXf5BkKVjxwPpiWVETh57OhS7laJ0hhjqr8ODinVqDcIp57ybFprWfX
brHsxTosktJqu4oqVjEVmjN8htxxrr0eBNOzR27g3LfwBCxbm8hkPKa9G4VRJ8Wz
w11iSSVNSucH61lQsBy2mQFswumhLnV5wzBkkHdsg+MqgLbBN1UENZbXDSqPnCxi
/otBDghLE4roNT4kVOWGFZCzw73i93g5mEosZINemnAnwwo4lzkKIEmLOiu9wZ9Y
ANAZjcMAKNgebmSnqQ30w6JRJCN1zDoucSxJINQ/2fXGM/zzKH99bLenDPpCBXgc
Al0fDIXt5xyX3LWYzsRyMDbqBbLMXVglC52dtCh7lfrUKsmDZ6xnQ8KN+bXMALPu
0yOKLy/maXJ0MPYabnRPxisCsW9IUjZApfhO3Oy+Ab4OlaIpX/DmKtWfVYiJTob8
C294nlLKWaTuAnil60u6ok4GBhEFKEkvJZ2NlGoaX1TQHgYiEOg=
=PT8E
-----END PGP SIGNATURE-----

--iVCmgExH7+hIHJ1A--

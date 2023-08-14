Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4686E77BA57
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjHNNmO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjHNNmG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:42:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785E4106
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 06:42:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F7036528D
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 13:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8C6C433C8;
        Mon, 14 Aug 2023 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692020524;
        bh=6i0lIGZB2K6cNVhaCBHFeOMta7lOQd5gC7KgaF8Xvv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dGkLSJ538hlzlbpEyWwTs34fEGOeSkzu25eBjwL/d7LfA3HpJhFty9G9e/XfKNH6u
         N1OReUv2WPiJuCRw7Sl+H/LHR2YKaee7IXokqsya72YZH6j/pW3Eidc1lpt7ee+cbu
         u8DgpalZLHB8B2S3qO/fD9c67ea9jb1SlZC+RZAmszOXfW5xSj+dFQUYwEM+DRT4hO
         PNmY5RGAZaeTIrGJKVyWtRbRex42mpdlT7/JQj75gk9mZgTFIe/td8lAwniFlSyd6D
         MO80d2MLXmcCvPk7iADR2sqgtzby4yZb/cpL7VTLFZ9RIJH/A9jaQL08OkW79OycEr
         kwJYpFnmpb2Mw==
Date:   Mon, 14 Aug 2023 15:42:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        yangyicong@hisilicon.com, f.fangjian@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH] i2c: hisi: Only handle the interrupt of the driver's
 transfer
Message-ID: <ZNovKVNuxXf457t8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@huawei.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, yangyicong@hisilicon.com,
        f.fangjian@huawei.com, linuxarm@huawei.com
References: <20230801124625.63587-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1peg8Ul36MINFZnY"
Content-Disposition: inline
In-Reply-To: <20230801124625.63587-1-yangyicong@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1peg8Ul36MINFZnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 08:46:25PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>=20
> The controller may be shared with other port, for example the firmware.
> Handle the interrupt from other sources will cause crash since some
> data are not initialized. So only handle the interrupt of the driver's
> transfer and discard others.
>=20
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Applied to for-current, thanks! I updated the comment to mention that
another port is likely the firmware. Similar like in the above text.


--1peg8Ul36MINFZnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaLykACgkQFA3kzBSg
KbYV5g/+IrVM1fuN7cE34+1RexgBGRFZxl1zUTEhVr4plBH/BNrMQv6/7LFsl5Q9
Yks8vCMxeBosmNS7lWnwuvZCnTDxfvI/FaYDScL3ZqHBFOf/3J+dbDLib/fMNKN6
BZz7/eFCBbgmXsmqzx/ipD1JL0Uh6bN8qtlCHSVBl7bw3ZKfrz19AqInAQqbBcQg
3xYuZB17wkW9tJO+xWqhWCEkX0VNhSBrjGL4/djt+9S3ZnllAT92GQt3gcXmKseh
xAkQGHQ79NgfMHT6Sfe5ZBkNAhT4gd4M/LvpouPMJ0J33tJES5r9Z4cF9sy8tjwr
YQb/9epouPXIiVmDcxDdEDnorejSZDpAMALrdQsuIQv3KGtulOJ6O2CpwzqgmCys
P97pJxo1cX4hmGYEc06Kusw2lLH3ZXDbJAAC0j/LBxu9usvwnJW2wz7Fb/7u8/2M
cX7SgEglmLUF3f5GR4Lo1GXTHOoyBPcihYZe29f4JAb2WU0LE0wbw69mnn2DNjya
HDkdux87jiu6sXRY8PHF7CtkbpxFMPDGra9TgR7U+bJ2iMEpWvWucuSQOstShJc9
0r/dieKP4p+ROaCMieJ4F0nNUqC9gYXKYQRPtpBzuo7s2hEN6tjI+2b8wHQdTjgw
0a1BVp8Q9gC7hfg2EtWKTyHbgraw+MQHcfUDpw1nSBHczwmsfn4=
=jjWg
-----END PGP SIGNATURE-----

--1peg8Ul36MINFZnY--

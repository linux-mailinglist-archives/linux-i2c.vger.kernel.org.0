Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1BAA689F6F
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 17:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbjBCQht (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 11:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbjBCQhs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 11:37:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E099A8439;
        Fri,  3 Feb 2023 08:37:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B084E61F6A;
        Fri,  3 Feb 2023 16:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC2EC433D2;
        Fri,  3 Feb 2023 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442266;
        bh=dNdaVxb5PW4CEkafXT121IOkVxBQlTcPIzvvxb+Shog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O1axfvjCiSUKDXPD3Actda8QebRerb8Rc7oEZI3daQS77lp2kpLbZdvLklJE4j7o1
         OpLeT4H6MpQVbW5hW2MdSyfSugo4m+eXSYgc/oe71zcZVdtgqDPJ0QAGCbcc0ruB4z
         /UwAXE9nAeentalFDTUsrAEzfPkXLUfkjaI9uoWFqAtdSAGlmUutaZ7xSYHbwjUIw4
         5x/TXupr4T8kNw8nMkviwkIZNA+RKu9u5B4LYlKjk8YEjnnuJ8Q9MVMWyMt7o/MNHj
         e3hfxGm+6bd1jj/zv8Oy2cgr5vmYQiXx1M0BI+wM8rbUkeI7wu1oKNf+iVJci74YCE
         q5Rk9dIA3H0rQ==
Date:   Fri, 3 Feb 2023 17:37:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V4 5/9] i2c: xiic: Add smbus_block_read functionality
Message-ID: <Y904V8zdCKDFxtR3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
 <1675330898-563-6-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="REmZzdpqahJJ1gqK"
Content-Disposition: inline
In-Reply-To: <1675330898-563-6-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--REmZzdpqahJJ1gqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:11:34PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> smbus_block_read is added to xiic driver to read from few sensors
> which support this command. Since the number of bytes to read is not
> known prior to transfer, xiic standard mode is being used for low level
> control of IP.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!

> -	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;

Note: Since you implemented I2C_M_RECV_LEN anyhow, you get the emulated
I2C_FUNC_SMBUS_BLOCK_PROC_CALL basically for free, so you could also use
I2C_FUNC_SMBUS_EMUL_ALL here.

If you'd like this, please send an incremental patch.


--REmZzdpqahJJ1gqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPdOFYACgkQFA3kzBSg
KbaDaA//Yq0UOuaVYq4VArqrqfGs+W/4qmgRccjYbdWjLcx77XAadAlJiWJ/YQAH
525PAd5ziSDB6B3VNKu6BZIXaLzYuYxbE3qLZjjro28r4Bl0oJA9SCjH8T19K4AW
D4o+aePktMjRC9yJ+iagGQPcP7NgfozMbT0w7uho0KqV8WU3xVDOOEAJ7k1qxTjU
lg7quCuXm33+fou1MjEgsUq2iRCfxJfyQaShEk+YgANTEP4A+9Vqg4SMGyp/SBcg
Y3suJZIBczR1of6V/XN7ufL4nV+FRZizGFAyNO/SHYLg5k0xd9/wMAtGv3XcE6HJ
7JM2ghVUWQ7lgo0cSdqghTfpJT3zVxTOdqq7XBF4qXhrztz8ZDOEXzBwRzB71bpY
awmRRLHe2lZRYKYqc3tOKUEQXceE9Sg0lDc7jVZqwtw1kVt1dwmVdjdwilraGuib
t5lzXcNEctOE+e/0eT5kwpzWWB4eC3ZndZbM63FixY3sc37Mhjwh0WSXUoz/n5pX
dkZdwY/pKlG+5BHiXf+mry7HrNrD8sX5xqhIbZBofF88xBJmRlgFILk3p4DEox3e
lhBs7u1Dvgb04JphTWpd+2JUO7KXM8RijjZ081AijMsHyUSRgdtBhnsXA2rtJBzb
XQCWQp4yNFuEOy3QR2dIKhH2IWIzhJoXGSshdtyF9tjzBYQvshc=
=wNvz
-----END PGP SIGNATURE-----

--REmZzdpqahJJ1gqK--

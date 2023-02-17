Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5A769B4FF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjBQVpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBQVpJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:45:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F62465355;
        Fri, 17 Feb 2023 13:45:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 391F6B82D9A;
        Fri, 17 Feb 2023 21:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6361DC433D2;
        Fri, 17 Feb 2023 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670301;
        bh=4nVsKq1ByObmyVxQpyyGc/X3CbL/kMX4cEXO3fl9p7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i0TN3JYh5+YpPhK8R4dLTUOGPaC58zdj70BXVs7C+igHaf0ez9bHpK+h1qMWCGqD3
         i8UW+cx4haUYuVV3SQMQIft71XbCS9t+ep0PljtFU0PDZgaRDpIXjU2oTGDNF6lD7Z
         retzibrPqNEm+lh7wtcfF3PvGD76mAVJ81nfoeKHXpAyQWrZgNt7ltQ86PmOK4BL6z
         KGpE14sGdqvGbN20b+3DozibMuNUAjI5rNgZNgqvE/opx1xgiFCRIScigt2+51L2a3
         8cBTT9Fu/zYt7lB1/Mi66SCTou6/b1Z987gFJ+qB7CntOGx0C06ZtT2VPxvNB6/xLg
         DZfgUjkgynZWA==
Date:   Fri, 17 Feb 2023 22:44:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V6 2/3] i2c: xiic: Update compatible with new IP version
Message-ID: <Y+/1WRzf1cth6/f+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
 <1676467944-17426-3-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iMa+Ii4xmEsDBl7q"
Content-Disposition: inline
In-Reply-To: <1676467944-17426-3-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iMa+Ii4xmEsDBl7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 07:02:23PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> Xilinx AXI I2C IP is updated with a bug fix for dynamic mode reads.
> Older IPs are handled with a workaround in which they are using
> xiic standard mode for all these effected use cases.
> Add the new IP version to compatible.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--iMa+Ii4xmEsDBl7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9VkACgkQFA3kzBSg
Kbbotw//TjVBsZOhqEtIufaBz03Dzh71ejketxOCYqEKjCWr1DHvqGJCdJwJpAH/
1RfSVf4z/FgaysNoCmUvO0ia/nZbu0kOWIGMRCk+s9NA1AgUdJdso4W5krb+Vs2I
O//8tjPsCV2ZcZjXc3e1ccDsBWjxSaVJcFqx/2eYSWK+NrnMvauCONiqOYXUbMAA
lq/HKuc+Tz6SjktXyLLAvvb5+lWTQvZwvIutPDrZMigAe5G7LeUzrxPWgHDdkk6D
UoxUSNsWaWwRO+PY2AojTVpEopbll2MCYNRBH+VmfMXOG2NRd1Iai7RgBj3uOVUH
O7r3KHoXgB16eO6nJaXhuuBZatLOpWWvmXYoL3D+W4xILbXYd/wbilyvkVU5gHHs
mZtUYIt7LE2q1SMWP2TFE/X0r556x690MinHa+9pqFax485Y14PCY+Bqw19tEuwO
myYL22nV/1Eyrg4lqo7p3sBqOpRaUTN9PGzJbm4SSgRVODyY9tsshtvshUwnWWS7
Gfq2R6MpZhSLX1FirQ/wREA9xipG+4f4jq3s9CIGBZ9zl/VbyKebseu++KvQXmCg
y1YnAhxroxDHCUDNKGLp+Dxo5yAy3v74qblUeTKAZdSAW1Ibu6CMU+zFDnhaNVOA
jBpt2a11g/6DahjYGmD5Z/fbP+z8Thyvad/89wq7kLkfZ1U79pM=
=+JfP
-----END PGP SIGNATURE-----

--iMa+Ii4xmEsDBl7q--

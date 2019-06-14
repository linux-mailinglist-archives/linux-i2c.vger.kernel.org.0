Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4203D46723
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 20:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFNSIc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 14:08:32 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44162 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfFNSIc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jun 2019 14:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=S6eD/OBjba2USkkWAIp4R8wMlj47jkpPE3pTAgWl2I8=; b=KjTjSpkRwpkDuBWkoD6399Van
        IO20atW52hTE983NlT/tLggv3kcG0UEVKslLvj7uskRpFSnPkRH6G/mKWr53Ee6K23+aRRfrvmF7p
        OKgyJysJdks8pDU7zntuTk+EKOudj+hAvkJinChxHxGuNni06xiYtsBNaq5pKffT/Uq0E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hbqcl-0000BB-BC; Fri, 14 Jun 2019 18:08:27 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id A288A440046; Fri, 14 Jun 2019 19:08:26 +0100 (BST)
Date:   Fri, 14 Jun 2019 19:08:26 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 21/28] drivers: Introduce
 bus_find_device_by_acpi_dev() helper
Message-ID: <20190614180826.GH5316@sirena.org.uk>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-22-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r21wuLfwIlf/vvzy"
Content-Disposition: inline
In-Reply-To: <1560534863-15115-22-git-send-email-suzuki.poulose@arm.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r21wuLfwIlf/vvzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2019 at 06:54:16PM +0100, Suzuki K Poulose wrote:
> Add a wrapper to bus_find_device() to search for a device
> by the ACPI COMPANION device, reusing the generic match function.
> Also convert the existing users to make use of the new helper.

Acked-by: Mark Brown <broonie@kernel.org>

This might have merge issues, I just applied some changes to the ACPI
parsing code the other day.

--r21wuLfwIlf/vvzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0D4pkACgkQJNaLcl1U
h9AmVQf/WWt5yCgqJS2hZ0wFS5SWw5i/JVNB1OTySWW4UwV8kzMIO9QKAQcU7Bjt
DSD24i2mUo/SaKBH+15eddgJLLJp4TNDVS8nKqhT+otXOn2usObZBjsVRtWwflu0
fqz3PoaUimH0t+spe5Zc6PeDh5vQZSnqlodIq4Z0enShaVZorKbLNWodISJFEGV3
F8AuiHutx8XotM8N3d5082oq84OJrKco7j0OMGNwZK0iP3oCWjjSZLPY9nAVhHVr
2Jb+oYxGskwzQGJTb1522E0Y8H8ZYjqYrpOXW0Sg+tbSP9gxoxOoJFnOzMQUlcAI
3khjbxrC4r6AoHawwMjUOc5V/BunEQ==
=t8zE
-----END PGP SIGNATURE-----

--r21wuLfwIlf/vvzy--

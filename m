Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD9676FA6
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jul 2019 19:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfGZRSc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jul 2019 13:18:32 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42338 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfGZRSc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Jul 2019 13:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RBX7tzBB3qOOwRPE91iIliUe4Au3MKtV5wsdWSb/SZs=; b=khpzyhyArncmH0mL33rxRuuoo
        tpja7bvM8+oKVU8hbzELWNPvdbdlGvU6hiqrKxNQu3p1aqXNdUdQ7Dre7Rj/WGjg1YXsjxy38z93n
        6Do7pXKlv4vSEAgseUHNtERU4zyhYrwQA0olkaPmp8FFsDCuEJLyELQOmBpMeoJfRFI8Y=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hr3rN-0002v0-0d; Fri, 26 Jul 2019 17:18:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 60BFA2742B63; Fri, 26 Jul 2019 18:18:24 +0100 (BST)
Date:   Fri, 26 Jul 2019 18:18:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drivers: Introduce device lookup variants by
 ACPI_COMPANION device
Message-ID: <20190726171824.GE55803@sirena.org.uk>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-6-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
In-Reply-To: <20190723221838.12024-6-suzuki.poulose@arm.com>
X-Cookie: Think sideways!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 11:18:36PM +0100, Suzuki K Poulose wrote:
> Add a generic helper to match a device by the ACPI_COMPANION device
> and provide wrappers for the device lookup APIs.

Acked-by: Mark Brown <broonie@kernel.org>

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl07Nd8ACgkQJNaLcl1U
h9AP6Qf/YGrw0TyOSSQSBXyPk+b+NdGM3zToNrnX22MlqJOqIoR1Cojj3bSvlBPh
X0GCuxCUvGTjhFC0Hrg4YvdCm68TiZwOyi8e8s7bwZfJQxz/Z7tDrCsumy62WuzF
qKxfi2q4CAm7FIRT4J7Q8AKVroxHaWs6mS2P/LzMkNUBOfXrMu4VNbObMaXkVt92
y1rqdWxtykM3LKPyO11gmxjRzlgtZsNuFLvgqUzJL6xTCvNPsYVilqr2TdlsSVtk
iyb9Bepc0jZslrKB9t/goFvPZ0hjB7o/WiCwXkPhcuIe/YgPZzIKapao7AGZruf4
Egk3xu2RdzcnwJMfkHYFGJzU5OaLwA==
=DtTy
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--

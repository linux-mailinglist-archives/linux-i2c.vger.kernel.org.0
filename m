Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF38649EDE0
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jan 2022 22:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236444AbiA0V5c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jan 2022 16:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbiA0V5c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jan 2022 16:57:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7B9C061714;
        Thu, 27 Jan 2022 13:57:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CCE31B823E7;
        Thu, 27 Jan 2022 21:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1C7C340E4;
        Thu, 27 Jan 2022 21:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643320649;
        bh=e723i9JsXHiEBbTu8G5kP5WOqV+gYsQ7539EIk3Couk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jTLm6VUWRh0zBTpuSHzCrAH9ZIyV26PkPIl3E5mZryTpHHnmCw5XQmCP1Q17gPhvT
         l2dES+87sD0EeITEWzUeAS15F6LbbWTqtvQPlz3WMcCdrFrMY74rlamHWx9dojqfsl
         UZyupnZeSqb+rIM5/jQLfsC96Tza4wWnP3DBVi3jQ/x7nz3gjWwL7iopJ3va/ZJ+4H
         XaXmh+gUP7VcWlLkcqq9nIXL0JA+gHSZwKozFhnRQH6ndK3p2cqtfp4se8tQlb+rXm
         0f8cYxE2h8VSRsOkd7LKgkJWItbXoR2ggYWZR8KYFMblC2A6UwCQ247td45sbubrLW
         eIOtaGZHmm0fA==
Date:   Thu, 27 Jan 2022 22:57:25 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     u.kleine-koenig@pengutronix.de, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, digetx@gmail.com,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v4 3/3] i2c: smbus: Use device_*() functions instead of
 of_*()
Message-ID: <YfMVRasTSQrr1ob+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, u.kleine-koenig@pengutronix.de,
        andy.shevchenko@gmail.com, christian.koenig@amd.com,
        digetx@gmail.com, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
 <1642851166-27096-4-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cP1k5dLGG5uGlg4g"
Content-Disposition: inline
In-Reply-To: <1642851166-27096-4-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cP1k5dLGG5uGlg4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> +	irq = device_property_match_string(adapter->dev.parent, "interrupt-names",
> +					   "smbus_alert");

I think we should include "linux/property.h" for it. Interesting, the of
header was never included.

> -		irq = of_irq_get_byname(adapter->dev.of_node, "smbus_alert");
> +		irq = fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
> +					    "smbus_alert");

Here we should replace of_irq.h with property.h.

Rest looks good!

Happy hacking,

   Wolfram


--cP1k5dLGG5uGlg4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHzFUUACgkQFA3kzBSg
KbaXLg/+NbejI22/3hLSSXg4aRbnAL2/VIok3hgahxmZb3KDl0VGicsM+YLDpUT6
gEc1ZEOvmqhPNiQim+ixd/BeIgAiOlg5Iq2EJPYHroFbWr8olecna4CK+c1Eqjtv
Esutk0oo0kVDci5N0JTKjvYkN78DsJiPthfl84jRDzQCpIRisx+wV/eskNOAJyVD
sUbPdR0KG5OyBbayXq5nM0sDWalGXidOXE83BBD87BmETRXQxGEefQH9Cz4JzoMr
51JM16YkR1ePtGbsmlvzhh/0QImpEFa2iBr1hq0ka3ssM8t8As7nfx1NS+WH67iz
eiGn51FkX0GVBrHLVNNY3KWymB/leFagHbD8HPx1ULGfxb0WzmqNtpCVq6+sxqug
D7jcUrLaFynK5a5+grd4UAvciM8vABA69ckm6sQ7DrvvcTn4oLf2ELchKtUBTAJt
OdGEs67m0gVvM/39kQy1QYBDN5ACj4IQgFMJ1uKzw12G+fFSLZGYGRJOdThwh9YA
Fjz/Fc2NTft2OH6QhK60o7y4jGz33bLKlILCmTKXraTGQ98dkAO6h3D/uRgoe/7u
3gEw7GGwyswnPNCXMC15w0HgBIzCxC346TAxu0vteT4pNEiHNlvKWSBXWh2gOPOx
QV94/mEFUOEvWNUGZTEOF73S0WlSp/M9O3yL/EPkWsU/PwkzrMk=
=g1E6
-----END PGP SIGNATURE-----

--cP1k5dLGG5uGlg4g--

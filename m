Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B75C393727
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhE0U2K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:28:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:43056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235524AbhE0U2J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:28:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A7A061360;
        Thu, 27 May 2021 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622147196;
        bh=cy1zdvQCkbyF8cbGtaUW+3spYF3RmL4ltiIOEIZGXTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LRpAz+Zy10IieHd0zOw9oMrAFqOFjHdkQ6rnJvVonE+xMbFBybp6MaAj2gQXI1IdH
         wEgPAZhR9pK2rKbl6aj/DAEug8PiyLXkjLp1WbIeQkKXB2zPcjGzYItapkH7Ke3sf+
         LFSiC79CS4PLUPwsR9Mj1THEJaJkcUZzN4Rh4O9ZOd+9wz2hPirbanP8youDZtvMEy
         TlEqbF574UBIrMurNf0tAOCp1W6YPs/IIusOsurS7ldudHPWe/9GfmmQQLkZ7tbdVt
         O9YfBRJv4ZCaEoEtiGJzyFaBwW+yKq7NyV2vMzV50qjH/MpGw4OkXplZgTCQT23JLD
         wN75hpiRFkqZg==
Date:   Thu, 27 May 2021 22:26:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev()
 for users
Message-ID: <YLAAedlB6UaJQh0X@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YkSC1hApOCzGjIKM"
Content-Disposition: inline
In-Reply-To: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YkSC1hApOCzGjIKM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2021 at 03:43:17PM +0300, Andy Shevchenko wrote:
> There is at least one user that will gain from the
> i2c_acpi_find_client_by_adev() being exported.

No objections per se. But as the user is in staging, I want to ask if
the use there is really a solution we would also accept outside of
staging? Or is it a hack?


--YkSC1hApOCzGjIKM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwAHkACgkQFA3kzBSg
KbZ39Q//Xi/xhfYvz+yPnbg09qxKQMLjTghIum8+MBovB6wG5KO3xJquun3lgwi2
91cLMUs4vccepTNqhLc9E2aTpEj7vXT+TXXdi5lquG7A5UyRRXtLjdUUpocgQkK2
c7XgdaghXzIHL2WQg/D69kWuCeqjDI2zKwozAUHj/xlq1VYH3G9t+JQjdCT2Mxr8
cxLfc3CMIGALlPUY7KWJs4D094vladvWSenCpsQMMLbkJVXEGfBGbnvntrOEhNqZ
w6WCapfG80/xPcVesMaQSRAkyTLIVwea/d0njRwmb3vd9GjhAtpc+2EHGJL16y0Y
WAywSlzqXFHg50laA7nnV8nGUBPOwztSI000Lpry/jWqeG2sGKkwer0vl6701+84
YBP7n1e3Fed/tNwlP5Ge38MAZg7q9tyhWn+PZmjccu3OPz0I/ITmQ3u3xjvVPyGp
1VtJ8kH124M6l7VsnaQVv1iA827+rPQVmZ6DWtuRFDNjuhtuLgnAf726hS9ZW3U6
tuR+BQDqM+Gno64KiErYiIEal5YVveCV3H5nub70hvVGKTsi2/Wpu5It3isQUppv
puv31INxtAA0lqivGAwNAQ9JyIYWH32Yktfl7MQGfR8WkKiDcgG0o9krHDXhTXWK
BAFQOOKvzTAmth8WGRktwJo2Pf3vQ6Yd6bb0yaNR9zIJbfV2hKM=
=CIL7
-----END PGP SIGNATURE-----

--YkSC1hApOCzGjIKM--

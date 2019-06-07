Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77C9E3865A
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfFGIdT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:33:19 -0400
Received: from sauhun.de ([88.99.104.3]:41478 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbfFGIdT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 04:33:19 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 2F7AE3E43BA;
        Fri,  7 Jun 2019 10:33:17 +0200 (CEST)
Date:   Fri, 7 Jun 2019 10:33:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v4 2/5] i2c: nvidia-gpu: add runtime pm support
Message-ID: <20190607083316.GB3360@kunai>
References: <20190603170545.24004-1-ajayg@nvidia.com>
 <20190603170545.24004-3-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <20190603170545.24004-3-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	pm_runtime_mark_last_busy(i2cd->dev);
> +	pm_runtime_put_autosuspend(i2cd->dev);

Much better to have this only once!

> +/*
> + * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
> + * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
> + * Documentation/power/pci.txt also insists for driver to provide this:

I'd think the comment up to here is enough and the rest can go. However,
I leave this decision to you.


--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz6IUwACgkQFA3kzBSg
Kbayuw//YoqrVxsInOgzDBmpVor1ssx26jYmc5NLKHY0ZzZYUsCp7EF19Ryq4rIU
6chHjJXuh+FcjBbZSracgax4p3HoEqFCzySG1dHk5dgjR5/MLfMEQuzmB7QTxqNw
4hLdw8KG9B2Nh6OCCqT9pEaaMyx5wGjY9fkUPBT5I1IPSY1lbvP0f+UlTAFU/7G1
H1/EgWhmcQPRgX9nh4MNW/WR04rrh89IPzzt2vi6eR4b2o1hSG3m5rEpHySbby+V
2bLJ31GGet75pEtO8mqu6RwhnP2h1+WXP71FaOShkBNu23EgHowRFcPdk5miiTiq
x7mAIrK0MVoDGXU52xV05/0JeNXI4aRf/T8KKH9d/acmgPqzCgoPvj+5g5KrfvGB
JJg9E3c/+i3CzrI6VOXsfd7WsbDFAtoTML2ZB3RyXqChg9px8c8joj1v6XQOXpJy
/bLzvbw9H5U6KDyQf1w1dQGI6elI84vS+FvyYhjyOmDWgmgbtxn0ggUrk7XSutjW
Zc559mQczVenavVLWbSkkqgbKgrEDJn9VmxBKtBHebti2R7NeLuEkgeJaYFqRWhC
ZVB61b7+GEkCopZC739O+BYir6jZe0XKyAqgPcIipVhY/jcAP+Z0yXGrh3IkdZpt
WdDxwhv78D7Ew2ZeWlahlzFXLNmcg9CT++hIVWD8KRGZ4+lRYyY=
=Kubz
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DE0DFCE6
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 06:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfJVE46 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 00:56:58 -0400
Received: from sauhun.de ([88.99.104.3]:54142 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbfJVE46 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Oct 2019 00:56:58 -0400
Received: from localhost (x4e37421f.dyn.telefonica.de [78.55.66.31])
        by pokefinder.org (Postfix) with ESMTPSA id 884872C0139;
        Tue, 22 Oct 2019 06:56:56 +0200 (CEST)
Date:   Tue, 22 Oct 2019 06:56:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
Message-ID: <20191022045655.GA975@kunai>
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
 <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
 <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Changes I submitted in this patch set is for a different purpose which
> is very Aspeed H/W specific, and actually it's a more serious timeout
> setting indeed. If this H/W is used in multi-master environment, it
> could meet a H/W hang that freezes itself in slave mode and it can't
> escape from the state. To resolve the specific case, this H/W provides
> self-recovery feature which monitors abnormal state of SDA, SCL and its
> H/W state machine using the timeout setting to determine the escape
> condition.

Thanks for the summary. I just wonder on what the timeout value depends.
Do we really need to put in DT or can we derive it e.g. from the
compatible value in the driver?


--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2ujBMACgkQFA3kzBSg
KbYZZg/+ILRBsr6VA2yU97i07DYrhNgIs0GsfqAA3zqC+JhbF/dyORbZWno4fIxZ
+qHvJ6pTQCR/jWA4aP1kO/NL9EU3nWIICyZHIFJpXBtwrH9mGP1+hlnyrWc2uaZC
JpOw3AKSYevrQb0RksLu16ZddmlMHO0+Qi2rkhh4LGcsdCiUZRSOEeoaQkiyS3Cy
hsb1uqiGFQFdq/gFv08rpW2ja7TGS/HMzs8RdXlOI03bL6ORXU9QCV6H2oIBl00v
9YQYHo9lV5PtRTweCpaN0o+9XLmP1y4A7kHS1lr9YVoRVT67HniEisum3t6UPR2H
B5Ha1IVzBYuqtoq0vhuiowNVmV9OROoM+alQxhw3g6HPT0K+d5GmD9k6aPNXWCod
rBT7QTBslplAZJNo6R2tGvh0wIYWU0PMJ+ZSsS9YdigSqMXfd8C1p2R6ZphdyCk7
dHfEaPa4iuUGYaJWiHFROYni/GhG1EBN3kpUSphG5ETA6Ur16blwXyAZy7oVm5xO
IsIVfsJYBiV/1O77xE7FUF8gXpIalsLLH7/AXH80JexMqZBpu5hg6N6GhbN7K4rl
wZBpfCNq9Rvy65BvFL4Vmw2elrZmo9S7vYs907eZ1ZJNWB9TVpqe+z0c9FNMuAKx
o1ZttPvRuKUhoQTMnQ734eW74vmmrl4IfguSGshRymILa5AaX1Q=
=INXh
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72FDD84FA8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 17:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbfHGPTq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 11:19:46 -0400
Received: from sauhun.de ([88.99.104.3]:45586 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387543AbfHGPTq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Aug 2019 11:19:46 -0400
Received: from localhost (p54B339F3.dip0.t-ipconnect.de [84.179.57.243])
        by pokefinder.org (Postfix) with ESMTPSA id 824BB3E43BF;
        Wed,  7 Aug 2019 17:19:44 +0200 (CEST)
Date:   Wed, 7 Aug 2019 17:19:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] i2c-axxia: support slave mode
Message-ID: <20190807151943.GA2338@kunai>
References: <20190801132129.GA5550@localhost.localdomain>
 <20190806205124.GG911@ninjato>
 <20190807070926.GB17104@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <20190807070926.GB17104@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> Good point. I'll remove those verbose messages and maybe leave one or
> two debug messages with just a summary of the status which will
> hopefully be a good compromise. Will that be ok?

Very likely :)

> BTW, I have added this synchronize_irq() in unreg_slave callback just to
> make sure it is save to set idev->slave to NULL already. Most of the
> controllers do not have such a guard and I'm wondering why that wouldn't
> be a problem for them. Like the i2c-rcar.c - isn't there a small race
> condition if some slave interrupt triggers just before ICSIER is cleared
> and somehow does not finish before priv->slave is set to NULL? This is
> the situation I was afraid of and tried to solve by using this
> synchronize_irq().

You have an important point there. unreg_slave is protected by the
adapter lock but this won't help if another master is requesting
something, thus, causing interrupts.

Phew, nearly all slave implementation need to fix this!

Thanks a lot,

   Wolfram


--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1K7AsACgkQFA3kzBSg
KbZqLg//ZndtTIMkWdZJhNKdzLFLoEMXKdUX296NeiLxm3jjuWgWKAAXytTl4EJp
+jAaVlae+F2Dvui51kWTRINq1iyzj9kyvGxK+jkaBA7Rk1hRtMX8aUla0uJi5Gmy
a2j/n8k4NTqnRo2p9QTqWOPWCGyfTfC6hHutFh3fkPiZRDcgawcqpMwGVMS+EDql
SJEYy7si5Ifso0ya9M+RBrb5OyoKim5tbFuF2xcNWIhUTLlCp0l1qihsi3fIn4PF
B8YoOHOEBgsPmkd+BcYP2MAK/KAr8tSyI6NKnXLN8bcN00HcvlYeDqwLrbdHqdpA
z/kNH507dmJYDOtdD9oM5Ov1Gi2jLwVKkgyQzz+BwDYa1DXlmlYqJnpOXDthu2zn
xzQohvZdqyFTdMALlFG+rqRaqxt5dsFlga3hpp/KYvKnPZ+sgU7og7ov3hcLGPuG
AZPpgrEEBXf1OmeJ4u1wxDNGjc7caCYLecD9XQnrINX6UjYMkCOg8d7h5Cvl6N1w
7c0oYPT8ZDCKBl2NQK0MBpnTU0rvKNa/yjCwZIZeDQxAkr0xYnMI8S9RycRAgTZH
W98e1YYFA+Sbba2AjkwD3EpVKdETHQC06h7Y9pQVSKoz/ATES6URM1NTAQB3D0LE
tr1zRnl6i452kYETMja5Y01Yk2drbKOq/YGqfgZKrZlZl2KvnPI=
=THVX
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--

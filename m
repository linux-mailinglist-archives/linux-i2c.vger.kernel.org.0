Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D25A8AA813
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 18:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731686AbfIEQPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 12:15:24 -0400
Received: from sauhun.de ([88.99.104.3]:58824 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbfIEQPY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 12:15:24 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 02E3C2C00C0;
        Thu,  5 Sep 2019 18:15:21 +0200 (CEST)
Date:   Thu, 5 Sep 2019 18:15:21 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH] i2c-eeprom_slave: Add read only mode
Message-ID: <20190905161521.GA3695@kunai>
References: <1567695164-20464-1-git-send-email-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <1567695164-20464-1-git-send-email-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			if (eeprom->read_only)
> +				return 0;

What about:

	if (!eeprom->read_only) {
		spin_lock(&eeprom->buffer_lock);
		eeprom->buffer[eeprom->buffer_idx++ & eeprom->address_mask] = *val;
		spin_unlock(&eeprom->buffer_lock);
	}

We can still keep only one exit point from the function this way.

>  	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  0) },
> +	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  I2C_SLAVE_FLAG_RO) },

"ro" missing. You haven't tested this entry ;)


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xNJUACgkQFA3kzBSg
KbYvzw/8DZSTgV5Pu78ucAQaGIoQ3eulQ+hy24JDM+6wTnWYl9ofjg4Nw1VpeVUI
e7/lyoLV5xZRvu+gpmdPMGS2IqHkkppunpkaoY3vNbJukca3yDXmL0mv/rJk2ZNL
iJUHOEK03EGtV6p1RM7KGmxQ6nP9NLaJmFNHXMgLpiBH8BkJFF4LuzWcx5E76Ooy
u6KCNIamyNaZKByWrFRFIxeaRT3K9U6ItOAnnbnEwv1aAuPAaFpJJKPA9iRXONgB
AlH4upDlaQqlskTK9t2O0tKePmnHACrNbyRyT7E523DwT98qelt2CTpC2AksqeJr
9EjNtCI+rVVnQKde4Pb77vBJB1ZnQaoo8FBhyVIfmO8B4RQixFrxqBM2U2l+LZz4
tHSf3JnFId6pk1bH6Pd78+eHFiPwGXMsEyr2031pAUH9GBJWxxgV1hpEzB7cHnM7
Fqskdsufx8VDddkdBP/n8cq5kfJYKSw9NqSmYlgKPjrG7CqbQKxdwOkDjcC2Dt2l
eZHpqZHaHKGqBTDhUaqJULhlwXhL5IZPflpIXCeuFqFyH7OhjVgo2IYe+nyr2a5N
AUo2WmbrY8xWIsuuD7JgIbF/SYbxKBRwhPcjZSSpoMNS6VTuGF/YIqsUKhZB/ekH
9fDcLq5fYPYg8qL6799vXVy5elcz/7JO6+kEKTpwye9EnsETSdE=
=QYVT
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

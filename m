Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30F51A3745
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 14:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfH3M42 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 08:56:28 -0400
Received: from sauhun.de ([88.99.104.3]:53618 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727718AbfH3M42 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 08:56:28 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 922732C0095;
        Fri, 30 Aug 2019 14:56:26 +0200 (CEST)
Date:   Fri, 30 Aug 2019 14:56:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: Re: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
Message-ID: <20190830125626.GC2870@ninjato>
References: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

> +/*
> + * If 'process_call' is true, then this is a multi-msg transfer that requires
> + * a repeated start between the messages.
> + * More specifically, it must be a write (reg) followed by a read (data).
> + * The i2c quirks are set to enforce this rule.
> + */

With all the limitations in place, I wonder if it might be easier to
implement an smbus_xfer callback instead? What is left that makes this
controller more than SMBus and real I2C?

> +	/* Process the read message if this is process call */

Also, the term "process call" here seriously sounds like SMBus.

> +		addr = msg->addr << 1 | 1;

addr = i2c_8bit_addr_from_msg(msg);

> +		u32 protocol;

Hmm, another SMBus terminology.


> +	if (num > 2) {
> +		dev_err(iproc_i2c->device,
> +			"Only support up to 2 messages. Current msg count %d\n",
> +			num);
> +		return -EOPNOTSUPP;
> +	}

With your quirks flags set, the core checks it for you.

Kind regards,

   Wolfram


--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pHPkACgkQFA3kzBSg
Kba6Ww/+MiQX21OGgbWmV1RzOJTJcm22OqliAmcBgIMJnQ3TB9Uoo0xpA4XkwD1z
tHnXk1VKf4NsN7NLnoGRG8hYHwZLIElSTQz89eP/PMCmNnj5pu0ebgfP9X+NvC84
vbFUN3fhmdhMlzvWlS/ixiEbvFud28JxJE9YAOpSDv+3sTMDM/EB2rTLk+tF1Hrn
+L3B0D2C99gN/fm9kakCYow3FBCXEIwv2CSok5YQ2OXPdteG/rSNnm+3q6gSnleg
xEgzP6MNSkCJXUaGVt4VSNZ8uek8GQSwy+ZnPr8M07bpmhEfYARJYirQCMatbBoj
0Ga9/TZn/tFfArKiJMbVMVMJNzo479UQR+NXLpdcTSTScTckAyeNiFECAHXLAw76
ZMx8q2SAiO2GR9u8xJl7OQoPZoyc+4nHoLxtQVLW1xf+Kfl0irzNBZGQ41dk1gVL
veiFQy3+By3BqwzA4BaOIU2gsXMYORQ1yIczK4vQOTzq6tShAzj3gjVbrl0ijfc/
2EtqHB2b8b9X44xd1FppKiHfzcVc8RpNLUziBdJxlWKfC0SAVqM47IcSe/2beynS
4BUh9UbHhuIjJ+cS0fLUuaCHukk5p22G+g/DqmbctT7kP5GaZ0vQ07dWFyxzNb9/
4e04NH5ZecIvlp2xlAuJBOn1DFIIBCHbDCPNhj59U5YhY6Mj6NQ=
=1TD/
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--

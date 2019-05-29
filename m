Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D622D40D
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 05:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfE2DB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 23:01:59 -0400
Received: from smtp103.ord1d.emailsrvr.com ([184.106.54.103]:57828 "EHLO
        smtp103.ord1d.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbfE2DB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 23:01:58 -0400
Received: from smtp5.relay.ord1d.emailsrvr.com (localhost [127.0.0.1])
        by smtp5.relay.ord1d.emailsrvr.com (SMTP Server) with ESMTP id 13CC9A019D;
        Tue, 28 May 2019 23:01:58 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1559098918;
        bh=dxk1NY8pRsVPWLjcp9o/Cvrv9iSK3H0mNb52VECozys=;
        h=Subject:From:Date:To:From;
        b=HVOZ521Hl7QMWUqq7mUULr8MvIxEYZto7hio+0rsM/MyRNWrTfM2GvLl0Vryk41b7
         6gnJhRBPsnx9Wx1monqXJIgvFgNtVG1X4oGti3cC/xsNkPfRBXu3ruHG7cMWAQkxpO
         Z5WpSL8rO6/+GiDK5KJMtjY7WnRMjjGNkIoYNyEA=
X-Auth-ID: mcdermj@xenotropic.com
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp5.relay.ord1d.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 2231CA00AB;
        Tue, 28 May 2019 23:01:57 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Tue, 28 May 2019 23:01:58 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <716a7b8a-c2f8-a3c4-0b3a-be3cb26a6c12@i2se.com>
Date:   Tue, 28 May 2019 20:01:56 -0700
Cc:     eric@anholt.net, f.fainelli@gmail.com, wsa@the-dreams.de,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <ACF57AF2-51C9-4884-BC65-126221CDAB5B@nh6z.net>
References: <20190508071227.18609-1-nh6z@nh6z.net>
 <716a7b8a-c2f8-a3c4-0b3a-be3cb26a6c12@i2se.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On May 28, 2019, at 12:52 AM, Stefan Wahren <stefan.wahren@i2se.com> =
wrote:
>=20
> Hi Annaliese,
>=20
> thank you for mention that we have multiple I2C interfaces.
>=20
> On 08.05.19 09:12, Annaliese McDermond wrote:
>> +
>> +static struct clk *bcm2835_i2c_register_div(struct device *dev,
>> +					const char *mclk_name,
>> +					struct bcm2835_i2c_dev *i2c_dev)
>> +{
>> +	struct clk_init_data init;
>> +	struct clk_bcm2835_i2c *priv;
>> +	const char *devname =3D dev_name(dev);
>> +
>> +	init.ops =3D &clk_bcm2835_i2c_ops;
>> +	init.name =3D "bcm2835-i2c";
>=20
> Does this work intentionally in case i2c-0 and i2c-1 are used at the
> same time?

It should work fine.  The clocks are all registered separately and =
passed
the pointer to the struct device for the interface.  This keeps it
accessing the correct registers and such.

> Please also check the output of /sys/kernel/debug/clk/clk_summary

They=E2=80=99ll come up with the same name in the current code in the =
debug
output.  I agree this is mildly confusing and I=E2=80=99ll spin another =
version
of the patch to give them unique clock names in clk_summary.

> Regards
> Stefan
>=20

--
Annaliese McDermonod
nh6z@nh6z.net=

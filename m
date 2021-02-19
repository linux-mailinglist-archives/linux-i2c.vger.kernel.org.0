Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA031FD47
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 17:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhBSQjy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 11:39:54 -0500
Received: from de-out1.bosch-org.com ([139.15.230.186]:58708 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhBSQjw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Feb 2021 11:39:52 -0500
Received: from si0vm1947.rbesz01.com (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
        by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 4Dhy2Z3pZQz1XLDQy;
        Fri, 19 Feb 2021 17:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1613752742;
        bh=sXeFcL6If6RssrcOWGRx6kTzKgXs6ITlrhOt7x9JCaM=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=eqZXUQIoMEHZvE/YElWvoFj3Fj0q5uUchFkfnjIIAKFBNvQXWAH+naFvBeUGp3xF5
         jcx26oQVlutTjhxD0wd3Vo6vPBItiF1Bj5tkPUyoIBI42B+rv/OHHG8IUUV3njddI9
         kZE+Q52DFrCf4Ns3ukxjSBssP5V7nE0XZMSA/cCw=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
        by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 4Dhy2Z3QqQz6CjQgJ;
        Fri, 19 Feb 2021 17:39:02 +0100 (CET)
X-AuditID: 0a3aad14-aa3ff70000000912-05-602fe9a6c51d
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id 9C.60.02322.6A9EF206; Fri, 19 Feb 2021 17:39:02 +0100 (CET)
Received: from FE-MBX2043.de.bosch.com (fe-mbx2043.de.bosch.com [10.3.231.53])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 4Dhy2Z2WmMzV16;
        Fri, 19 Feb 2021 17:39:02 +0100 (CET)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 FE-MBX2043.de.bosch.com (10.3.231.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Fri, 19 Feb 2021 17:39:02 +0100
Received: from FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f]) by
 FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f%6]) with mapi id
 15.01.2176.004; Fri, 19 Feb 2021 17:39:02 +0100
From:   "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Subject: AW: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Thread-Topic: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Thread-Index: AQHW/i8DZH9Zyk+L4UOePGh9RfRJ9apPvvGAgA/8yzA=
Date:   Fri, 19 Feb 2021 16:39:01 +0000
Message-ID: <90bd35fa8c6f420fb1656c678c016509@de.bosch.com>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
 <PR3PR10MB41422B90076115ACCE07D2A5808E9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PR3PR10MB41422B90076115ACCE07D2A5808E9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.121.124]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsXCZbVWVnfZS/0Egwm/JC2Wvl/KbHH/61FG
        i46/XxgtLu+aw2ZxdM89Zourv9ezWOxtvchscXf/XEYHDo8Vn/Q9ds66y+6xaVUnm8eda3vY
        PD5vkgtgjeKySUnNySxLLdK3S+DKuLvlC2PBer6KifvCGhjPcXcxcnBICJhIHDnC38XIxSEk
        MJ1J4s+L/0wQzi5Gias9L9khnLeMEud2XmSEcA4wSvy58wuojJODTcBOYv/rN2C2iEA/o8SE
        c8EgRcwC+5klThzYxgySEBawl/j65w8byD4RAQeJ+euDIOqtJPY//gjWyyKgKnH01ipGEJtX
        wFpiZct/qGVAM9+8mMQI0sspECux5Jo8SA2jgKzEhg3nwcYzC4hLbHr2nRXElhAQkFiyByIu
        ISAq8fLxP6i4kkRbWyMTRL2OxILdn9ggbG2JZQtfM0PsFZQ4OfMJywRG8VlIxs5C0jILScss
        JC0LGFlWMYqmpRqU5RqamxjoFSWlFlcZGOol5+duYoTEq8gOxpM9H/QOMTJxMB5ilOBgVhLh
        3f5cL0GINyWxsiq1KD++qDQntfgQozQHi5I4rwrPxjghgfTEktTs1NSC1CKYLBMHp1QDk/zm
        46eTl738rSsgNFGBo23VsranoYxr1hu4bAy7Z9zQzs5/et/h3ZN5rtxu0lmccaz4mdJnsT01
        TU8/3OtusK7a9yxYkHfub+3WKx96DW7NtJq8Yd2ZfRcWHS1RyM65sZDtU9aiZYc6WH/MEUpO
        lXwqeFnaad2nzsVrmzXvXzl3jm1accjNPCbGVTtnF+6/976v5pnGX59vLqyHd9lKmWf+unJf
        9sPT6PLmw1aiCuX3tnwNeZAoyBT0c8qJic1Ll7CdLJx0h+WgweQz8VzPU973Hj6zV7ZEPc1z
        h4xMYtzDayqdJ85qro25nrztp6F8ccDsFKP6fauzLhTl600s6VStykjP0gsoOrL5239BnyYl
        luKMREMt5qLiRACHkMWkRgMAAA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

> > From: Hubert Streidl <hubert.streidl@de.bosch.com>
> >
> > By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> > means the PMIC will automatically reset the interface when the clock
> > signal ceases for more than the SMBus timeout of 35 ms.
> >
> > If the I2C driver / device is not capable of creating atomic I2C
> > transactions, a context change can cause a ceasing of the clock signal.
> > This can happen if for example a real-time thread is scheduled. Then
> > the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> > a write message could end up in the wrong register. This could cause
> > unpredictable system behavior.
> >
> > The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> > interface. This mode does not reset the interface when the clock
> > signal ceases. Thus the problem depicted above does not occur.
> >
> > This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> > reasonably be assumed that the bus cannot obey SMBus timings if this
> > functionality is set. SMBus commands most probably are emulated in
> > this case which is prone to the latency issue described above.
> >
> > This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> > otherwise enables the SMBus mode for a native SMBus controller which
> > doesn't have I2C_FUNC_I2C set.
> >
> > Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
>=20
> Thanks for your efforts. Looks sensible to me, so:
>=20
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

Is the patch already on the way upstream?

Is https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=3Dfor=
-mfd-next the right place to watch for mainlining progress?

Thanks,
Mark

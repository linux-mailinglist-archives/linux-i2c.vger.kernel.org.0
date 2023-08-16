Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D2377DB12
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 09:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242378AbjHPHXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 03:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242416AbjHPHXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 03:23:04 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4318810C0;
        Wed, 16 Aug 2023 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
        In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=19wNukchLNZN0X4BtCFwuraW6co2nA0L6OybOEKuK5o=;
        b=YpNByOB7g1IeEdiFV3iyCqTmeHxRkXVPCM3MQO1wt1Ns/37QoLBuTNDcbRj7Q0jxudCwuubWM9E
        QFRwLXTTz4fx+k7kp5fwULyg12M2nNMm8MI5cWF/ta+/3RwElmDJE86zQOpKuJXVF35J0ahG6avpe
        E0gnMtU8iZUnK7NOAjjNcehgEgIRfwtNNvMbwXMhkCeM55cgwLCgyEmizU/JMkdms7cxV30vhahf4
        BdqmYVoSiAyOmUMCzUexKIf/U5XXyNuvqAXqrVTamc4OUF1vwSgjwcBEj9degPrODmzSCWpoRSICJ
        P7jwylFy7oDDEbU9h9uSoEREx8hUbxgkaBcQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qWArr-0004Ll-VD; Wed, 16 Aug 2023 09:22:59 +0200
Received: from [2a06:4004:10df:0:1cda:5a2e:6344:82ff] (helo=smtpclient.apple)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qWArr-0004Ez-FQ; Wed, 16 Aug 2023 09:22:59 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2] i2c: stm32f7: Add atomic_xfer method to driver
From:   Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <5E10F2AD-6D7E-4F2F-ACEB-B6FD3C71C85D@geanix.com>
Date:   Wed, 16 Aug 2023 09:22:48 +0200
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB5067F1-28CC-4011-A6FF-0695916D764C@geanix.com>
References: <20230718105435.2641207-1-sean@geanix.com>
 <20230802100709.GB2156918@gnbcxd0016.gnb.st.com>
 <5E10F2AD-6D7E-4F2F-ACEB-B6FD3C71C85D@geanix.com>
To:     Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27001/Tue Aug 15 09:40:17 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain,

> On 16 Aug 2023, at 09.02, Sean Nyekjaer <sean@geanix.com> wrote:
>=20

[ =E2=80=A6 ]

>>> _dev {
>>> u32 dnf_dt;
>>> u32 dnf;
>>> struct stm32f7_i2c_alert *alert;
>>> + bool atomic;
>>=20
>> I am wondering if this atomic really needs to be within the struct.
>> It could well be given as last arg of stm32f7_i2c_xfer_core and
>> stm32f7_i2c_xfer functions.
>=20
> Agree.

Scratch that=E2=80=A6
The atomic was included in the struct because it=E2=80=99s also used in =
the isr function, as the isr function is calling stm32f7_i2c_xfer_msg()

/Sean


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F5E7457E5
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 11:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjGCJAr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 05:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGCJAq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 05:00:46 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B592394;
        Mon,  3 Jul 2023 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
        In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=s3S1d1mAF8fMxePjQb4GdgTmpVEFy5v/YG/rsY8z00g=;
        b=borwZeNYhMf70JYxVnxVQcu7MCBG2AsjMN6P33P7/loB6oHNCKymp7tvwbNGAOBUuohAfqkzQBz
        CgIs0DK4VfX379T188k/V2s0I4BIDwc7wNH0SCQg96DDo7j11IZz3EzS8RN43RsW/K+JJn+rnIYNv
        kZOZbvNMKyF4znag43vhaJAqxbPRYy/+13oVsiFfEdL8cojfAsYSYx8gjctvnx7Ec7XonojNB4U30
        Zm/hAOQpPfThGev8ngVTsiJC+H2vOeWZdVdM5eIwW8oofoVsyjccrmWGWY0pPyG4kQyu331SXAK3I
        6RQ6MvYUSdnjhqyYigGhjzocL4VRFxAlynfA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qGFQJ-000BBH-0c; Mon, 03 Jul 2023 11:00:43 +0200
Received: from [185.17.218.86] (helo=smtpclient.apple)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qGFQI-000QPD-I4; Mon, 03 Jul 2023 11:00:42 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH] i2c: stm32f7: Add atomic_xfer method to driver
From:   Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <ZJV0/cbjn1Qa62u+@shikoro>
Date:   Mon, 3 Jul 2023 11:00:31 +0200
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9BEDFE6D-AE5E-46F1-A1BF-A19C6F5130F6@geanix.com>
References: <20230509132159.4160984-1-sean@geanix.com>
 <ZJV0/cbjn1Qa62u+@shikoro>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26958/Mon Jul  3 09:29:03 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On 23 Jun 2023, at 12.33, Wolfram Sang <wsa@kernel.org> wrote:
>=20
> On Tue, May 09, 2023 at 03:21:59PM +0200, Sean Nyekjaer wrote:
>> Add an atomic_xfer method to the driver so that it behaves correctly
>> when controlling a PMIC that is responsible for device shutdown.
>>=20
>> The atomic_xfer method added is similar to the one from the =
i2c-mv64xxx
>> driver. When running an atomic_xfer a bool flag in the driver data is
>> set, the interrupt is not unmasked on transfer start, and the IRQ
>> handler is manually invoked while waiting for pending transfers to
>> complete.
>>=20
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>=20
> Pierre-Yves, Alain, any further comments to this patch?
>=20
>> Is it okay to keep the DMA transfer in atomic?
>=20
> Will DMA actually run in atomic mode?
>=20

Hi Wolfram,

Atomic is mainly(only) used for writing a single register in the PMIC =
for the stpmic. Guess that will not trigger any DMA use.
But let=E2=80=99s wait for other comments=E2=80=A6

/Sean=

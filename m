Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E4A569A99
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 08:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiGGGil (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 02:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiGGGij (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 02:38:39 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31AA227FF4;
        Wed,  6 Jul 2022 23:38:38 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26715pJ4025688;
        Thu, 7 Jul 2022 08:38:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=zVSoqRqzuyLq0LopHTrb8YdEclj7FIl5rpVJUrthI2k=;
 b=w+uiFBF0FBVSp44RBV9b1Kcfs3BdqUZ74D9ShD5VGMkXXK0mYTb9Arap/KCgCGIifmWI
 rtdiT0iWPg8Vyyh4Nqo9U29dp9QAyeIzaTSI+DqR2Fb2jm7ykJgjknkPN4voXBu9PkG+
 FDOzzLYb2JDKTg+t2meV++Sg1eUAQ4Ea7Gj9mGEPFs9NC3RwXkUMIIh04LuGNbAKy5jV
 X1NbnD2ju33Gx4yMCguebN2TgG/M+zmKeEIziaciSOOcmIztE8XraC8AZsrGQ99QN7T+
 YH9a4vBLKTDi+cwFJE3xmNb5fe9asU7Chmc1uW9mLV+hs2uYcoR/IMG5Mp+jUEDOPxGa rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h58bp6h7c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 08:38:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D979810002A;
        Thu,  7 Jul 2022 08:38:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5B6420F570;
        Thu,  7 Jul 2022 08:38:18 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 08:38:18 +0200
Date:   Thu, 7 Jul 2022 08:38:13 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Rob Herring <robh@kernel.org>
CC:     <wsa@kernel.org>, <mark.rutland@arm.com>,
        <pierre-yves.mordret@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: st,stm32-i2c: don't mandate a
 reset line
Message-ID: <20220707063813.GA2428347@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Rob Herring <robh@kernel.org>, wsa@kernel.org,
        mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-2-alain.volmat@foss.st.com>
 <20220628134115.GA345270-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220628134115.GA345270-robh@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Tue, Jun 28, 2022 at 07:41:15AM -0600, Rob Herring wrote:
> On Mon, Jun 20, 2022 at 12:54:02PM +0200, Alain Volmat wrote:
> > Update the dt-bindings of the i2c-stm32 drivers to avoid the
> > needs for a reset property in the device-tree.
> 
> That is clear from the diff, but why. Some chips don't have a reset? 
> If so, this should be combined with patch 2 as part of changes needed 
> for a new version.

Alexandre has just pushed a pull-request enabling support for the
clock/reset [1] so I will shortly push a v2 of the serie dropping the
first 2 patches.

Thanks
Alain

[1] https://lore.kernel.org/all/a250f32b-f67c-2922-0748-e39dc791e95c@foss.st.com/

> 
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > index dccbb18b6dc0..8879144fbbfb 100644
> > --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > @@ -94,7 +94,6 @@ required:
> >    - compatible
> >    - reg
> >    - interrupts
> > -  - resets
> >    - clocks
> >  
> >  unevaluatedProperties: false
> > -- 
> > 2.25.1
> > 
> > 

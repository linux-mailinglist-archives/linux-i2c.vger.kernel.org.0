Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53309264605
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 14:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgIJM3h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 08:29:37 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10470 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730439AbgIJM2N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 08:28:13 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08ACLl4W029687;
        Thu, 10 Sep 2020 14:27:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=ozH/MrmZcNkm8zensiVKRNgv2DwWIwyb8qliXp9Emeo=;
 b=y79UUdbyDqeKo5Y6Oubk6v79C48n4YQMoXQsAjrNGWcRDbLMAbjA679tq6GSy+mlZ8LU
 DpbO5YIjE1CoRwhsT3q1hm2nM6pCD5PWB0pfMgaNBUq6EGwOc4L7wvhO2Jv8YBZFWVeA
 VGZgMJ8Ymojh7L6M2/FypYNuP0ZeT5rCJX2m2PCtG5yjkjjmnXJBtuakyLieNGZKfsjy
 Q3w68TL27IlgOHdIkwu2Rg8jQAjQH6zbTpnrhGP0KqGJ2DLPN3eqNZJ+bMi7CwQ/c0f/
 /L7OvVtr7u14TlfHeD6f1YVDIc4LzalUx7btgxuNK3abLX1yWhDiY9ZVYoMJ8exS0cS3 Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33byt83qpa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Sep 2020 14:27:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBD6F10002A;
        Thu, 10 Sep 2020 14:27:43 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B59E92A8B2F;
        Thu, 10 Sep 2020 14:27:43 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.44) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 14:27:43 +0200
Date:   Thu, 10 Sep 2020 14:27:39 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     <pierre-yves.mordret@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Holger Assmann <h.assmann@pengutronix.de>
Subject: Re: [PATCH] i2c: stm32: do not display error when DMA is not
 requested
Message-ID: <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, pierre-yves.mordret@st.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Holger Assmann <h.assmann@pengutronix.de>
References: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
 <20200910100607.GJ1031@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200910100607.GJ1031@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-10_03:2020-09-10,2020-09-10 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 10, 2020 at 12:06:07PM +0200, Wolfram Sang wrote:
> On Thu, Sep 10, 2020 at 11:32:29AM +0200, Alain Volmat wrote:
> > DMA usage is optional for the I2C driver. check for the -ENODEV
> > error in order to avoid displaying an error when no DMA
> > has been requested.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> > ---
> > This patch should be applied on top of the patch [i2c: stm32: Simplify with dev_err_probe()]
> 
> We can do it in this order, it just makes backporting to stable kernels
> (if that is desired) a bit harder than a self-contained patch. I am fine
> with both approaches, but just wanted to point it out.

Indeed, that's a good point. I'll rework it then, to avoid the dependency
on dev_err_probe change. If that is ok, I propose to push a two patches serie
with both this fix (updated) followed by a rebased version of the
dev_err_probe patch from Krzysztof for dev_err_probe change.

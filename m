Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF81C1B0FA4
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 17:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730295AbgDTPM7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 11:12:59 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:37600 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730173AbgDTPMC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 11:12:02 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03KF7nfO015137;
        Mon, 20 Apr 2020 17:11:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=4wle+BCTKMTBKSpUmBME32Lx6QZ8URVEdWZoWxaJkyY=;
 b=DfxtwDuRe8VAsuC7SLh6qmShFY8uJTfq7AEasGTQSE7lsGzXklDgpBj8ab76EF57BEXH
 MJuWISBM43wO8WCU8RhHv1eTukfa95cpZpZ8NccKJubeYbkJ45uvSiJdb/HcXzq1wdxf
 xBkB5ICagyRga31i8QpYWQqaTNIKFLQw5v9u9EDX5swCJBAS1wsW6beAak/agKvNohMk
 mHIarn2scI2iF0oM9Yj9chI24DGS7tX0LgeuPXQINA+saws8GysBrREOnYuJEFdpHnA4
 +XFJTaC94LaTT5+HHpYC9Zmv7ANHcKmLzQrlC0py2eMsA6DyxHplCMhsqh3N8YKQYs0k Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30fq11b0bn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Apr 2020 17:11:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E23C810002A;
        Mon, 20 Apr 2020 17:11:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D46CE2A608B;
        Mon, 20 Apr 2020 17:11:55 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Apr
 2020 17:11:55 +0200
Date:   Mon, 20 Apr 2020 17:11:52 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <pierre-yves.mordret@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH] i2c: stm32: don't print an error on probe deferral
Message-ID: <20200420151152.GA10855@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
References: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
 <20200415110145.GN1141@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200415110145.GN1141@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-20_05:2020-04-20,2020-04-20 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Apr 15, 2020 at 01:01:45PM +0200, Wolfram Sang wrote:
> >  	if (IS_ERR(dma->chan_tx)) {
> > -		dev_dbg(dev, "can't request DMA tx channel\n");
> >  		ret = PTR_ERR(dma->chan_tx);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_dbg(dev, "can't request DMA tx channel\n");
> 
> dev_dbg for tx...

Intention was to not change too much the original code when introducing this
check and fixing this message level in another patch. But I guess indeed this
can be done all at once.

I am pushing a v2 fixing this in this patch and having dev_err for both tx & rx
dma requests.

> 
> >  		goto fail_al;
> >  	}
> >  
> > @@ -44,8 +45,10 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
> >  	/* Request and configure I2C RX dma channel */
> >  	dma->chan_rx = dma_request_chan(dev, "rx");
> >  	if (IS_ERR(dma->chan_rx)) {
> > -		dev_err(dev, "can't request DMA rx channel\n");
> >  		ret = PTR_ERR(dma->chan_rx);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(dev, "can't request DMA rx channel\n");
> 
> ... and dev_err for rx? Intentional?
> 



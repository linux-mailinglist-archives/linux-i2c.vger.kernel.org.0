Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663CC462F17
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 09:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhK3JAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 04:00:48 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60372 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234724AbhK3JAA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 04:00:00 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU6eth0000494;
        Tue, 30 Nov 2021 09:56:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=6a8nITZiU0Po48YLbpF42GkCXHu+wbzPhZFof3AiSYU=;
 b=btzVLl/RvuNBsF5pqT6k7kIv2qoxy171PcgHBvHWjZtsXbnId2CuEdGV/B16ANPp2SBf
 syBUiHmXKWU6fpUcYnLkvlxDw1upKKQOGSMSq3vYqoNDFRY5zwsZYeSKOOOa1eGkoxAG
 SyD/OK+LwDRTFWGONh/gDV+HzJmcWAecBRoGCr5sYSGw87b1QmRB/Q7WK1bAUDxz+aHc
 RajPAVOzbq+pPVKLpIPzWJbu0ArvwfBLjx8UR2Y5N7sxEzvxuJ6cHZV37OzYru/Mn/xs
 ypjlTcu2abfglgsZnctwnca7/+s/LBwPZY671TtPd+7xbUdXHcthVEDINNJ1H0Uo8mjK FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnewbgse7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Nov 2021 09:56:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CBAF10002A;
        Tue, 30 Nov 2021 09:56:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0075721E674;
        Tue, 30 Nov 2021 09:56:25 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 09:56:24 +0100
Date:   Tue, 30 Nov 2021 09:56:18 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Wolfram Sang <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 2/4] i2c: stm32f7: recover the bus on access timeout
Message-ID: <20211130085618.GA668426@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
 <YaTE0f9ciy5JRZ3Q@kunai>
 <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
 <YaTNDq7rEyQIopim@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YaTNDq7rEyQIopim@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_06,2021-11-28_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain,

On Mon, Nov 29, 2021 at 01:52:30PM +0100, Wolfram Sang wrote:
> Hi Alain,
> 
> > > > +		stm32f7_i2c_wait_free_bus(i2c_dev);
> > > 
> > > This does only a controller reset, not a bus recovery with 9 toggling
> > > pulses, or?
> > 
> > indeed. I might better rework this and at the same time introduce the
> > bus recovery mechanism via the bus recovery callback in this driver.
> > Please don't merge this patch and I will rework that.
> 
> Wait a sec. Resetting a controller at the end of a failed transfer might
> make sense if the controller is otherwise in an confused state.
> 
> Full bus recovery (9 pulses) should be done at the beginning of a
> transfer when SDA is low, though.
> 
> So, I'd actually suggest to apply this patch and add full bus recovery
> based on SDA low at the beginning of a transfer seperately.
> 
> What doo you think?

I just checked again.  Indeed, this patch is here to handle cases when
communication went bad with a device leading to controller being left in
a confused state.  This is done to put it back in a working state.

I agree with you on the fact to decouple this with the 9 pulses bus
recovery and first apply this one first.

Thanks.
Alain

> 
> All the best,
> 
>    Wolfram
> 



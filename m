Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD63461535
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 13:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236772AbhK2Mih (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 07:38:37 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41492 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243882AbhK2Mgb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 07:36:31 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AT8k0St028222;
        Mon, 29 Nov 2021 13:33:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=sjSsap/99PK+qLLv6/E8NRXNL95MRU5g3ZSQAhekza0=;
 b=GVk4/HLmeJqSpE3xH1R0B0CVFAONWg4SFcg5KUIIDuVXL8WgimzpPYDSeeW8H5rDomdH
 xnK0cj1kr5QgNxUYjQGb845llErAqtrjUrI0dwzG5eO0j0rycsgNboU4IVlcWjjZQhzm
 BlkzIymn1fDb+LoT2UhhE32MLvOaJ9ku6dYc2ApOxeGJUmwvXnlOUQL48AjAoUXFrYNk
 ol7HvGG88HZ90YaKw30xUsw+RC+ui2/lIU06+y+4vFo16izDffSVIHF548H6xyTVaJQk
 36LCuHTthigq0UbJxySk4JGELygB0fM46lqI2/2+pjzqXgqVgDHBSY55Y6Yh/7PziN5P 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cmnj9k46c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Nov 2021 13:33:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0056610002A;
        Mon, 29 Nov 2021 13:33:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E88B6215130;
        Mon, 29 Nov 2021 13:33:03 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 29 Nov
 2021 13:33:03 +0100
Date:   Mon, 29 Nov 2021 13:33:02 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Wolfram Sang <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 2/4] i2c: stm32f7: recover the bus on access timeout
Message-ID: <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
 <YaTE0f9ciy5JRZ3Q@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YaTE0f9ciy5JRZ3Q@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_07,2021-11-28_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram

On Mon, Nov 29, 2021 at 01:17:21PM +0100, Wolfram Sang wrote:
> 
> > +		stm32f7_i2c_wait_free_bus(i2c_dev);
> 
> This does only a controller reset, not a bus recovery with 9 toggling
> pulses, or?

indeed. I might better rework this and at the same time introduce the
bus recovery mechanism via the bus recovery callback in this driver.
Please don't merge this patch and I will rework that.

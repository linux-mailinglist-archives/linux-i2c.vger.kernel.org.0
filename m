Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74923464E81
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 14:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349469AbhLANLq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 08:11:46 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36642 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231538AbhLANLq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Dec 2021 08:11:46 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B1BXqVn026536;
        Wed, 1 Dec 2021 12:41:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=y+lWVTF7ChstYU55k0XJsQjtnrTGXQm1BJqRGO3NL6k=;
 b=fAqFS9wDCZu+bDhm+hcsbf59KUJ8W9VyaQ7atI03nhsmoXaaZOeA2iavt3sMIq74FV0h
 KU/Yo9+ZSNWZT/FQWs7zAVH5P+KzL1rGwBOZfLx6ojPnspETMREQJJepOOHPTryuLdcR
 ghlcl+F7KYAPZ1k4v9C+A0TpVrfD632Q75Fk1Wa3iJaFGOGfbPJZBBNtzCOzvJmDhh8/
 lPo/Oqp9/cJHqhaKAyh2l/deOmaB6fdoVS4UlIvBt9zoGmZY9czplaJm/ogLEFW0g+PM
 Jk0tF8S2xwiO3Z0O2jJF1e66KjaZO937vYsaESRWV1boebWQaSkIKSpYkad77PLxyGJE eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnyy6jv26-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Dec 2021 12:41:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 618C6100034;
        Wed,  1 Dec 2021 12:41:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5627A2190E8;
        Wed,  1 Dec 2021 12:41:56 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 1 Dec
 2021 12:41:55 +0100
Date:   Wed, 1 Dec 2021 12:41:48 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>
CC:     <pierre-yves.mordret@foss.st.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 0/2] i2c: stm32: A few cleanups
Message-ID: <20211201114148.GA828165@gnbcxd0016.gnb.st.com>
Mail-Followup-To: wsa@kernel.org, pierre-yves.mordret@foss.st.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20211201110348.825901-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211201110348.825901-1-alain.volmat@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sorry for the noise.  Issue with my mailer.  Will resend properly
the same serie in a sec.

On Wed, Dec 01, 2021 at 12:03:46PM +0100, Alain VOLMAT wrote:
> A few cleanup, removal of unnecessary messages regarding bus busy
> and recovering bus.
> Make the function stm32f7_i2c_release_bus void since it is never
> returning any error message, allowing to get rid of the error handling
> within the calling function.
> 
> Alain Volmat (1):
>   i2c: stm32: get rid of stm32f7_i2c_release_bus return value
> 
> Wolfram Sang (1):
>   i2c: stm32f7: remove noisy and imprecise log messages
> 
>  drivers/i2c/busses/i2c-stm32f7.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> -- 
> 2.25.1
> 

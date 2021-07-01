Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841753B8F1E
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 10:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbhGAIyQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 04:54:16 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:11038 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235008AbhGAIyQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jul 2021 04:54:16 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1618gpRq027678;
        Thu, 1 Jul 2021 10:51:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=vtkNmwsSYfkYlSTI8h9TA+PQPEL6nyCvhM4AHGuOwbY=;
 b=TF8U8qsXDNoAW6+m9V7EQvfGWsZdPsQ6PYZ9IHkZ5GBk7SSnjtUgqml/hnF+sNm7ZSiz
 rw6WUv8gtcbN+CuQGy9BlYDjBg/8l2bAxQDuKr6VLO7PTh4LEXlZTI+vqb13RVpBcR3q
 z23YdRpyDQZBHLMpANaRVYjY6H6JS3Wn7zaUOR//DJ9qd5u29oHxrNp+jogkdK+rYp1q
 jqH9pRfOOMQdaYkWzLBqOaHPXK+6bShBgN0N8DQ402ptiHLusossUrgrG2Z6wHlTHAoF
 bJb4XzaKqTj2yvVwgcDa8l08+QbwR8pmXjPu11ax6Le6qXZxjTpnr16/pzONXtr6oeoO DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39h7yj28s9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Jul 2021 10:51:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3BFF10002A;
        Thu,  1 Jul 2021 10:51:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F909212ABF;
        Thu,  1 Jul 2021 10:51:32 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 10:51:32 +0200
Date:   Thu, 1 Jul 2021 10:51:25 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 0/3] i2c: stm32f7: several fixes in error cases
Message-ID: <20210701085125.GA28021@gnbcxd0016.gnb.st.com>
Mail-Followup-To: wsa@kernel.org, pierre-yves.mordret@foss.st.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-01_06:2021-06-30,2021-07-01 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

please put this on hold for the moment as I might have found an issue
with one patch.
Sorry for the noise.

Regards,
Alain

On Wed, Jun 30, 2021 at 04:11:40PM +0200, Alain Volmat wrote:
> This serie provides several fixes needed for cases when communication
> when a device is not behaving properly.
> 
> Alain Volmat (3):
>   i2c: stm32f7: recover the bus on access timeout
>   i2c: stm32f7: flush TX FIFO upon transfer errors
>   i2c: stm32f7: prevent calling slave handling if no slave running
> 
>  drivers/i2c/busses/i2c-stm32f7.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> -- 
> 2.25.1
> 

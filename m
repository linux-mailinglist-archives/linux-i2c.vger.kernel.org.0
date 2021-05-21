Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC0F38C924
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 16:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbhEUOYg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 10:24:36 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37302 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236338AbhEUOYf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 10:24:35 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14LE3Ijk029199;
        Fri, 21 May 2021 16:23:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=Qs5lu+rz1M3h2XolN2IhO6/pPCgYiG7nes1ykQCrdDg=;
 b=G7IYe8CAcQyv0ZsYvLKbjCOecP2QkpR0znTbMpA+394QAVyZukxN00aQAZ0+zJ2epaiF
 QKwRu9Hzp3l0Bu99NXxu0QPHxYhY6UYpdRqB2P+yX+kVcONiVB3zWTn8S7kWRZdCyZUs
 cCtsZzbNlTC/1hrSPieOI49hY1bAocMo2C+bBzHnurg8lvHOq9QsMlZRrM275ZH0siig
 /aELPK2prfmJqx3atS3TDlDyqGETeoqj2gR/mhKbgE3z8HdExChwvxK75jcUsM1juDBP
 jsHi5Cp1kdaWzDsKynEsBlKx3/P6szkireEy2iLVmsc0d+Id2wYxYckbezxz8mynZVbZ kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38p2tc3m6b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 May 2021 16:23:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 167A810002A;
        Fri, 21 May 2021 16:23:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A501226792;
        Fri, 21 May 2021 16:23:07 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May
 2021 16:23:06 +0200
Date:   Fri, 21 May 2021 16:23:05 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Lee Jones <lee.jones@linaro.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 13/16] i2c: busses: i2c-st: Fix copy/paste function
 misnaming issues
Message-ID: <20210521142305.GC17641@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-14-lee.jones@linaro.org>
 <20210521141757.GA17641@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210521141757.GA17641@gnbcxd0016.gnb.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-21_05:2021-05-20,2021-05-21 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Oups, didn't notice the typo fix was done in another patch.

All ok for me then.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

On Fri, May 21, 2021 at 04:17:57PM +0200, Alain Volmat wrote:
> Thanks for the fix. I was about to propose it ;)
> 
> On Thu, May 20, 2021 at 08:01:02PM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/i2c/busses/i2c-st.c:531: warning: expecting prototype for st_i2c_handle_write(). Prototype was for st_i2c_handle_read() instead
> >  drivers/i2c/busses/i2c-st.c:566: warning: expecting prototype for st_i2c_isr(). Prototype was for st_i2c_isr_thread() instead
> > 
> > Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> > Cc: Maxime Coquelin <maxime.coquelin@st.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-i2c@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-st.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> > index faa81a95551fe..30089b38044b5 100644
> > --- a/drivers/i2c/busses/i2c-st.c
> > +++ b/drivers/i2c/busses/i2c-st.c
> > @@ -524,7 +524,7 @@ static void st_i2c_handle_write(struct st_i2c_dev *i2c_dev)
> >  }
> >  
> >  /**
> > - * st_i2c_handle_write() - Handle FIFO enmpty interrupt in case of read
> > + * st_i2c_handle_read() - Handle FIFO enmpty interrupt in case of read
> 
> Could you also fix the typo enmpty -> empty at the same time ?
> 
> >   * @i2c_dev: Controller's private data
> >   */
> >  static void st_i2c_handle_read(struct st_i2c_dev *i2c_dev)
> > @@ -558,7 +558,7 @@ static void st_i2c_handle_read(struct st_i2c_dev *i2c_dev)
> >  }
> >  
> >  /**
> > - * st_i2c_isr() - Interrupt routine
> > + * st_i2c_isr_thread() - Interrupt routine
> >   * @irq: interrupt number
> >   * @data: Controller's private data
> >   */
> > -- 
> > 2.31.1
> > 
> 
> Regards,
> Alain

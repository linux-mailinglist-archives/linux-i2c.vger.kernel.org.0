Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAE62107EB
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 11:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728790AbgGAJVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 05:21:53 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:24032 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728776AbgGAJVw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 05:21:52 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0619BDjP023035;
        Wed, 1 Jul 2020 11:21:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=+Zy5DDQ6neW7WZl6/peSwMUygFppp3WoiU0yXaaJpbA=;
 b=GCEP0SIzeIG1mHgGTwtgiKR9RWx7wQzNjnzmWb9N7YEIbzIw5Q7FVwQtUJndnvYtKKsK
 7bHgKXs4nmIGb/wsxvpjrxDHyW7jfiK7aQXgd6NJif9U9Pm1J3TiT5Y5BrGjUSdpIwNx
 2tXk6yWHBJIrZZUkwc1vvXfC6YCosXncgjSgNSIV4hvog4nJo1htXMemdd9cXuSReFgs
 0Vlyubs6+BsZSmdSKtTlW6W5bCmhcYNCRegO25bu8YOVels9Tv3OnL7WRPeeBBfpZsmz
 tBvr6HsCrloHEM4kKC/dckQwWQGEub+6lHq21+BsrzSjU7L2ttKq7zALpXg8pdL44Qvi 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wu89s8fg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 11:21:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7396410002A;
        Wed,  1 Jul 2020 11:21:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39AFD2AA395;
        Wed,  1 Jul 2020 11:21:40 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 11:21:39 +0200
Date:   Wed, 1 Jul 2020 11:21:38 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <pierre-yves.mordret@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 0/4] stm32-f7: Addition of SMBus Alert / Host-notify
 features
Message-ID: <20200701092138.GB3457@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, pierre-yves.mordret@st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
 <20200630160500.GA2394@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200630160500.GA2394@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_04:2020-07-01,2020-07-01 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 30, 2020 at 06:05:00PM +0200, Wolfram Sang wrote:
> On Thu, Jun 25, 2020 at 09:39:25AM +0200, Alain Volmat wrote:
> > This serie adds SMBus Alert and SMBus Host-Notify features for the i2c-stm32f7.
> 
> If it is not too much work for you, I think it makes sense to split the
> series into two, i.e. HostNotify and SMBusAlert parts.
> 

I've just prepared the 1st new serie with only the HostNotify bits in it.
(basically, the core part, the dt-bindings with the enable-host-notify, and
the usage within i2c-stm32f7).
You mentioned in the other thread that you still have some more review comment
I believe. Is that right ? If that is so, I'll wait for those comment and
then push that new serie for review.

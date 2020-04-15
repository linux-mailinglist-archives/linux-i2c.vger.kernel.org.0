Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1871AA37E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 15:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506064AbgDONKw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 09:10:52 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:20516 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2897063AbgDOLfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 07:35:39 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03FBW8SN016220;
        Wed, 15 Apr 2020 13:35:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=xwnv8U88f9gKci+4R9gluFy4x+fECpay1QPWcflQP9g=;
 b=1a6J3nynIHUs1ZBzTWuJaxYH4jNMp3BBhK17usGCKTozaL9ffKuxXU3NnHI3yV4ftL92
 mUQ3c0K60Y/1B5c5Aw+jOsV3cYnjNz2jekg253yeaXkRAquScKAT8NaCw/KJEnaJfBH8
 7Mhaon5u4CZ1iu7zjqwVUHVNVKonEp7bsvRsWwJdOo9HV5E4ioVxswrMG4/w3VaYeWJx
 mTUQbXbcrBLEVNBSXsVzmrj2asfCnrgh21Do4WePhZYLMkhH3arPyJsulQzX3JKur0wl
 AzjJIVogGD6M6WOBUGCHzyIXhFee9d5c/8D3qvZORE8OFsTb9ZMi6paQUpZvbnB/+FxL lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30dn94bh6t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Apr 2020 13:35:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B759110002A;
        Wed, 15 Apr 2020 13:35:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9F772B0FA8;
        Wed, 15 Apr 2020 13:35:23 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 15 Apr
 2020 13:35:23 +0200
Date:   Wed, 15 Apr 2020 13:35:22 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <pierre-yves.mordret@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH] i2c: i2c-stm32f7: improve nack debug message
Message-ID: <20200415113522.GB16949@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
References: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
 <20200415110101.GM1141@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200415110101.GM1141@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-15_03:2020-04-14,2020-04-15 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 15, 2020 at 01:01:01PM +0200, Wolfram Sang wrote:
> On Thu, Mar 19, 2020 at 07:21:55PM +0100, Alain Volmat wrote:
> > From: Fabrice Gasnier <fabrice.gasnier@st.com>
> > 
> > Add information on slave addr in the nack debug message.
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> 
> Applied to for-next, thanks! (I'd drop the __func__, though; doesn't
> add information, does it?)

In fact similar message is displayed in 2 places. One in case of master mode
isr and the other one in case of slave isr. This message is adding slave
address to the master mode isr. It only makes it more clear on first sight
but indeed displaying the slave address obviously means this is master mode.

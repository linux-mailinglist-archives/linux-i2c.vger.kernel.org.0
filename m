Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B7446150B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 13:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239960AbhK2Mbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 07:31:50 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41596 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239808AbhK2M3u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 07:29:50 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AT8UeAC024974;
        Mon, 29 Nov 2021 13:26:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=G6PSSYkYmZM0MaQPoLImSJDApg8FN1Eq02Ab0suxV6U=;
 b=C+yRdUm4u05HRyZBVfUMGlaA8sdhNHX/m9bNNcKbUJWQRLMaY1xyV2Ne9x6y70g3ELhH
 f6UJ8bvsOJRr3hjW4DL97EbL/4nfQOWE2mP+VVC7VeOEcrLo3JOkxMl3H4Xz8v2qbqn/
 pkJpKnOAl0/mbDWQvO7tRV795uc32INN5GAsa4XdHULWIoJtEB1sRykajaCYgahQaMYE
 oF0g2nhpqnYL/GgWLiPaxgRCxXOv34wQ6DmBdd5U3r3pLQjmoVQT8yWujEYyXMqEkRq9
 BqP0SkUVbA5uhNDFsRpbgntc2zQNkkKjE0Oy6S3tLk2fJqZDF2EdnnjbGObQpk7LE3lL /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cmudrsedc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Nov 2021 13:26:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1739810002A;
        Mon, 29 Nov 2021 13:26:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AF88214D22;
        Mon, 29 Nov 2021 13:26:11 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 29 Nov
 2021 13:26:11 +0100
Date:   Mon, 29 Nov 2021 13:25:45 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Wolfram Sang <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 3/3] i2c: stm32f7: prevent calling slave handling if no
 slave running
Message-ID: <20211129122545.GA486850@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
 <1625062303-15327-4-git-send-email-alain.volmat@foss.st.com>
 <YaTFsV0sIU6BA0ja@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YaTFsV0sIU6BA0ja@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_07,2021-11-28_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Nov 29, 2021 at 01:21:05PM +0100, Wolfram Sang wrote:
> On Wed, Jun 30, 2021 at 04:11:43PM +0200, Alain Volmat wrote:
> > Slave interrupt handler should only be called if there is actually
> > a slave registered and running to avoid accessing an invalid pointer.
> > 
> > Without this commit, an OOPS can be generated due to a NULL ptr dereference
> > while receiving an IT when there is no master transfer and no slave
> > running:
> >   - stm32f7_i2c_isr_event
> >   - no master_mode hence calling stm32f7_i2c_slave_isr_event
> >   - access to i2c_dev->slave_running leading to oops due to
> > slave_running being NULL.
> > 
> > Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Is this one still of interest? You resent patches 1 and 2 but not this
> one?

No you can ignore it. Thanks.

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB51569E1
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 14:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfFZM7f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 08:59:35 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:39326 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726484AbfFZM7f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 08:59:35 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QCwkwj012710;
        Wed, 26 Jun 2019 07:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=5q6jUCOYM9n5oRbj1I8q/MxVpQIaNgBFlodxyx/t+e4=;
 b=UVHnhcB8kZVj1Dea0QCv3pbFg9aByid6wKNlGLkaW5QVhUZw8NBnvirI2gLiglzaV0lD
 QkzxHqFVDoQJ0TW3qXqakmrZ5IlRsTomW5vzuHRZCYCyNSv/b5OTzHRhORbK02ZJDWXs
 g7ZmPyn13mK8e0Ja2S0x9rvGDyfdFdUwyK/pjlzZMxSiufo/7U944rgdjdkpj2/SqvZd
 s1aGekjmaAYCxSxMYfpbllDfw/Qraf19Fmf4RCmWl0Jc4us23zd3gYzHOt5tUfnKE0ve
 tPzSsqTPPG9kca7KIhjfnaVHwpNZpqjN6P75yvlgEGvu3nQzCzUJ5I93DMgrecD36Xko Ew== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt8576-1;
        Wed, 26 Jun 2019 07:58:45 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail4.cirrus.com (Postfix) with ESMTP id 5306C611C8AF;
        Wed, 26 Jun 2019 07:58:47 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 13:58:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 26 Jun 2019 13:58:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 038CA45;
        Wed, 26 Jun 2019 13:58:45 +0100 (BST)
Date:   Wed, 26 Jun 2019 13:58:45 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        <wsa@the-dreams.de>, <jarkko.nikula@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.tissoires@redhat.com>,
        <jbroadus@gmail.com>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v6 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190626125845.GD54126@ediswmail.ad.cirrus.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
 <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
 <20190625115011.GE2640@lahna.fi.intel.com>
 <20190625124245.GC54126@ediswmail.ad.cirrus.com>
 <20190625132515.GA9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190625132515.GA9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=678 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260155
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 25, 2019 at 04:25:15PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 25, 2019 at 01:42:45PM +0100, Charles Keepax wrote:
> > On Tue, Jun 25, 2019 at 02:50:11PM +0300, Mika Westerberg wrote:
> 
> > I would be happy to squash the two patches, and go back to the
> > i2c_client approach, if that was preferred and  as long as Andy
> > doesn't mind.
> 
> I don't.
> 

Groovy alright think I will squash these two patches and return
to the i2c_client interface.

Thanks,
Charles

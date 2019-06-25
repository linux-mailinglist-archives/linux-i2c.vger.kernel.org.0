Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C9654F1F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 14:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbfFYMnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 08:43:19 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:53860 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726414AbfFYMnT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 08:43:19 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5PCdVAc014779;
        Tue, 25 Jun 2019 07:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qJNJ0G7W0vE6s3OqOcOl2XdM6LMSlfN3u2FHbWa6UpQ=;
 b=pY6wfuaFA0Y6b8kBsHQZ1LZ+exgjvHhgzPHMeIjAZZXPjX8okcreo5O9WEre2RwJgr6D
 1pNKdWyyczPHxNdS8iY1t+My/3+xJNsqQtRLyGvsHwKoS7nSdEkvzyeXhRwG+gWGiB9X
 a34N0U9SMZxePtSApUiRF/2Ffh4O7YyrJGJgNhIcc32w+Mo8bZ6AYJ4+SAzW4hFG/a21
 KQ03nLQ9JfZCKrPpq6W4cIYdAn0c8+zOVv3D7Lp/knGcJ299ZYeMdzmp7+8WIgmjjwTZ
 OSkX8KRUIJjdCfOBoQxa1SQmYOApjx2cimL081N3s8eDl85HzQtsWxRd64dgJv5mBqgd mA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t9grnvmb0-1;
        Tue, 25 Jun 2019 07:42:46 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail3.cirrus.com (Postfix) with ESMTP id B52846143C13;
        Tue, 25 Jun 2019 07:43:33 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 25 Jun
 2019 13:42:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 25 Jun 2019 13:42:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 38F612A1;
        Tue, 25 Jun 2019 13:42:45 +0100 (BST)
Date:   Tue, 25 Jun 2019 13:42:45 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <wsa@the-dreams.de>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v6 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190625124245.GC54126@ediswmail.ad.cirrus.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
 <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
 <20190625115011.GE2640@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190625115011.GE2640@lahna.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 25, 2019 at 02:50:11PM +0300, Mika Westerberg wrote:
> On Fri, Jun 21, 2019 at 11:08:12AM +0100, Charles Keepax wrote:
> > In preparation for more refactoring make i2c_acpi_get_irq available
> > outside i2c-core-acpi.c.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > 
> > Changes since v5:
> >  - Pass a struct device rather than acpi_device to i2c_acpi_get_irq,
> >    note this is more awkward than I would have liked as I am very
> >    unconvinced that adev->dev can actually be passed to
> >    ACPI_COMPANION. If anyone can answer that for sure that would be
> >    very helpful.
> 
> I don't think you can do that.
> 

Yeah I think we are pretty sure that is not possible, although
not what is done in the patch, was just responding to on an
earlier comment.

> I probably missed some previous discussion but what's wrong passing
> struct i2c_client instead and use ACPI_COMPANION() for that?
> 

Really this is all about the splitting out the original patch
into two patches, one to export the function and one to move its
use to probe time. There isn't really any nice way to do it as two
patches and still pass the i2c_client struct. Hence we ended up
on this system with struct device.

I would be happy to squash the two patches, and go back to the
i2c_client approach, if that was preferred and  as long as Andy
doesn't mind.

> > 
> > Thanks,
> > Charles
> > 
> >  drivers/i2c/i2c-core-acpi.c | 13 +++++++++++--
> >  drivers/i2c/i2c-core.h      |  7 +++++++
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > index c91492eaacd93..37bf80b35365f 100644
> > --- a/drivers/i2c/i2c-core-acpi.c
> > +++ b/drivers/i2c/i2c-core-acpi.c
> > @@ -145,8 +145,17 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >  	return 1;
> >  }
> >  
> > -static int i2c_acpi_get_irq(struct acpi_device *adev)
> > +/**
> > + * i2c_acpi_get_irq - get device IRQ number from ACPI
> > + * @client: Pointer to the I2C client device
> 
> I think this should be @dev now.
> 

Yes it should, sorry will fix that.

Thanks,
Charles

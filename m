Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE3C843FC7
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 18:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731476AbfFMQAA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 12:00:00 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:34226 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731469AbfFMItW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 04:49:22 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5D8hupF013156;
        Thu, 13 Jun 2019 03:49:00 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t0ae2yd16-1;
        Thu, 13 Jun 2019 03:49:00 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail3.cirrus.com (Postfix) with ESMTP id 91AE2613139C;
        Thu, 13 Jun 2019 03:49:44 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 13 Jun
 2019 09:48:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 13 Jun 2019 09:48:58 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C31072A1;
        Thu, 13 Jun 2019 09:48:58 +0100 (BST)
Date:   Thu, 13 Jun 2019 09:48:58 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <wsa@the-dreams.de>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190613084858.GU28362@ediswmail.ad.cirrus.com>
References: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
 <20190611123101.25264-5-ckeepax@opensource.cirrus.com>
 <20190612152718.GC2640@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190612152718.GC2640@lahna.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130070
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 12, 2019 at 06:27:18PM +0300, Mika Westerberg wrote:
> On Tue, Jun 11, 2019 at 01:30:58PM +0100, Charles Keepax wrote:
> > In preparation for more refactoring make i2c_acpi_get_irq available
> > outside i2c-core-acpi.c.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > 
> > Changes since v3:
> >  - Move the change to use the helper function from i2c-core-base into its own patch.
> > 
> > Thanks,
> > Charles
> > 
> >  drivers/i2c/i2c-core-acpi.c | 15 +++++++++++++--
> >  drivers/i2c/i2c-core.h      |  7 +++++++
> >  2 files changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > index 7d4d66ba752d4..35966cc337dde 100644
> > --- a/drivers/i2c/i2c-core-acpi.c
> > +++ b/drivers/i2c/i2c-core-acpi.c
> > @@ -144,8 +144,17 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >  	return 1; /* No need to add resource to the list */
> >  }
> >  
> > -static int i2c_acpi_get_irq(struct acpi_device *adev)
> > +/**
> > + * i2c_acpi_get_irq - get device IRQ number from ACPI
> > + * @client: Pointer to the I2C client device
> > + *
> > + * Find the IRQ number used by a specific client device.
> > + *
> > + * Return: The IRQ number or an error code.
> > + */
> > +int i2c_acpi_get_irq(struct i2c_client *client)
> >  {
> > +	struct acpi_device *adev = ACPI_COMPANION(&client->adapter->dev);
> 
> Is this adev checked for being NULL somewhere below before it is being
> dereferenced?
> 
> It could explain the issue Benjamin is seeing.
> 

Yeah could be that or just for some reason this isn't returning
the same adev as we previously had. I will do some digging see if
I can find any likely culprits.

Thanks,
Charles

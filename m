Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18BB22C17C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 10:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfE1IiI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 04:38:08 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:34852 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726557AbfE1IiI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 04:38:08 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4S8Ypex005799;
        Tue, 28 May 2019 03:38:01 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sq24q31hw-1;
        Tue, 28 May 2019 03:38:01 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 995EB611C8B3;
        Tue, 28 May 2019 03:38:00 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 28 May
 2019 09:38:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 28 May 2019 09:38:00 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EE3A22A1;
        Tue, 28 May 2019 09:37:59 +0100 (BST)
Date:   Tue, 28 May 2019 09:37:59 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 3/6] i2c: acpi: Factor out getting the IRQ from ACPI
Message-ID: <20190528083759.GE28362@ediswmail.ad.cirrus.com>
References: <20190527151932.14310-1-ckeepax@opensource.cirrus.com>
 <20190527151932.14310-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190527151932.14310-3-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=815 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905280058
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 27, 2019 at 04:19:29PM +0100, Charles Keepax wrote:
> In preparation for future refactoring factor out the fetch of the IRQ
> into its own helper function.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  
> +static int i2c_acpi_get_irq(struct acpi_device *adev)
> +{
> +	struct list_head resource_list;
> +	int irq = -ENOENT;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	ret = acpi_dev_get_resources(adev, &resource_list,
> +				     i2c_acpi_add_resource, &irq);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	acpi_dev_free_resource_list(&resource_list);
> +
> +	return irq;
> +}
> +

Sorry just noticed I forgot to add the kernel doc. Will fix that
up in the next spin, or do an incremental patch.

Thanks,
Charles

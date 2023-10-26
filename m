Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575717D832D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 14:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjJZMyl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 08:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjJZMyk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 08:54:40 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5C812A;
        Thu, 26 Oct 2023 05:54:38 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39QALq2P007775;
        Thu, 26 Oct 2023 05:54:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pfpt0220; bh=g1V7wwkUPbnoJiIPN3V1FwlNaUNkXv3AH/vM2O8hOFM=;
 b=YNIsmpkCx4mmhYSk8THrC8ioKwgiEIqeRQidPTt6aC0NPGZp+pDN9tH1K5HwN3YoqPia
 XRzFGaOvtWTLbu4uIZ9pse+uaXkLN3nBegvnKtn9IFwfLfW2QhHKLBrLiXlEWWQ6VARB
 8TilOF8uVULGuupbhnCzKunc7MvaU/lYvLmkTOLWgCRu+f8qZPxDonPIp5eIvJGDUskO
 gncqDl+tRxbI+0Sb9el0tS1ooJXBwVEeQpIVYHYZbWoIgfLFZWSjYdtFGXLnMSU/N4Yn
 4AsBmy8VFvUsu9psUGU4GXnPDoGwqLpGh1733Frm1wO03vgmLpWldj+3d4cZm4hWKxtb Xw== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3txcsr26xw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 26 Oct 2023 05:54:35 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 26 Oct
 2023 05:54:30 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 26 Oct 2023 05:54:30 -0700
Received: from Dell2s-9 (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id E7AB73F7097;
        Thu, 26 Oct 2023 05:54:29 -0700 (PDT)
Date:   Thu, 26 Oct 2023 05:54:29 -0700
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <rric@kernel.org>, <cchavva@marvell.com>, <sgarapati@marvell.com>,
        <jannadurai@marvell.com>
Subject: Re: [PATCH v2 0/4] i2c: thunderx: Marvell thunderx i2c changes
Message-ID: <20231026125429.GA22428@Dell2s-9>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
 <20231024201440.ey7pjah7fq33mbwm@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231024201440.ey7pjah7fq33mbwm@zenone.zhora.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: P7QQPQ46ZBItY3Q0sigTu8a3c05aoSbI
X-Proofpoint-GUID: P7QQPQ46ZBItY3Q0sigTu8a3c05aoSbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_10,2023-10-26_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 24, 2023 at 10:14:40PM +0200, Andi Shyti wrote:
> Hi Piyush,
> 
> On Fri, Jul 28, 2023 at 05:00:00AM -0700, Piyush Malgujar wrote:
> > The changes are for Marvell OcteonTX2 SOC family:
> > 
> > - Handling clock divisor logic using subsytem ID
> > - Support for high speed mode
> > - Handle watchdog timeout
> > - Added ioclk support
> > 
> > Changes since V1:
> > - Addressed comments, added defines as required
> > - Removed unnecessary code
> > - Added a patch to support ioclk if sclk not present in ACPI table
> > 
> > Piyush Malgujar (1):
> >   i2c: thunderx: Adding ioclk support
> > 
> > Suneel Garapati (3):
> >   i2c: thunderx: Clock divisor logic changes
> >   i2c: thunderx: Add support for High speed mode
> >   i2c: octeon: Handle watchdog timeout
> > 
> >  drivers/i2c/busses/i2c-octeon-core.c     | 96 ++++++++++++++++++------
> >  drivers/i2c/busses/i2c-octeon-core.h     | 27 +++++++
> >  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 23 ++++--
> >  3 files changed, 115 insertions(+), 31 deletions(-)
> 
> I was going through the patches that failed to receive an answer,
> is this series still valid? Do you still need a round of review
> here?
> 
> Andi

Hi Andi,

Yes, these patches are still valid. These have been acked by you
and were waiting to get reply from Robert.
Please review the patches.

Thanks,
Piyush

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7926E3D7A56
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 17:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhG0P76 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 11:59:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1554 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229569AbhG0P75 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 11:59:57 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16RFgG7e033051;
        Tue, 27 Jul 2021 11:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=XaSc/Wt3VOhRhYRfb4ziMBSu9t/ZtvP7pymZ+cQcG8o=;
 b=HGrRnaEZuHSMkTR5XfQ17e3NAW5fuO7Y/B0Pi+6OG/ght2od7Us5/RTO1pclvAtqqHwn
 9ZSfhfQhEjPThDRAKCCrm0GejjLwL8nY19QkeJpBjExY/qwUpoeff4SDIX6FjhKf0dQN
 nGZbwerkJpY4ufCKC2qBeR/ifxrxkZLE880kGbSJ3cMesxHHqSnrysKE9+U/z1lQBOpy
 dYwx1QHpx4hnE2/Cv7NP+yQySsyqI1TFK4Wa3dTOyaqQpiIFHnZ1mIjEAw/ifSd9kv5N
 2wF0muInuxubV7jPHUGkKXaGWnpYR+VFvR/YLc78sG1w1pR/xhKPual9v6J79heSBQ0A SQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3a2kbd55yx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 11:59:54 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16RFwMJ8007585;
        Tue, 27 Jul 2021 15:59:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma04dal.us.ibm.com with ESMTP id 3a235n1trb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 15:59:53 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16RFxqGM30015966
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 15:59:52 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CA85A28068;
        Tue, 27 Jul 2021 15:59:52 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6A1A628059;
        Tue, 27 Jul 2021 15:59:52 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.139.59])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 27 Jul 2021 15:59:52 +0000 (GMT)
Message-ID: <600b3bc1cdd570b0954f7a61865975f3f3158c90.camel@linux.ibm.com>
Subject: Re: [PATCH] i2c: mux: pca954x: Support multiple devices on a single
 reset line
From:   Eddie James <eajames@linux.ibm.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Tue, 27 Jul 2021 10:59:51 -0500
In-Reply-To: <997d20b4-457c-17ba-e9bf-193132768afa@axentia.se>
References: <20210505215918.45720-1-eajames@linux.ibm.com>
         <997d20b4-457c-17ba-e9bf-193132768afa@axentia.se>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7mK_MrH5vxyFrILPGfV8PtFV_McVdRaL
X-Proofpoint-GUID: 7mK_MrH5vxyFrILPGfV8PtFV_McVdRaL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-27_10:2021-07-27,2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270093
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 2021-05-07 at 00:08 +0200, Peter Rosin wrote:
> Hi!
> 
> On 2021-05-05 23:59, Eddie James wrote:
> > Some systems connect several PCA954x devices to a single reset
> > GPIO. For
> > these devices to get out of reset and probe successfully, only the
> > first
> > device probed should change the GPIO. Add this functionality by
> > checking
> > for EBUSY when getting the GPIO fails. Then, retry getting the GPIO
> > with
> > the non-exclusive flag and wait for the reset line to drop. This
> > prevents
> > the later probes from proceding while the device is still reset.
> 
> (nit: proceeding)
> 
> The patch assumes that all muxes with interconnected resets are only
> ever reset "in symphony". But there is no guarantee anywhere that
> this
> actually holds.

Thanks for your comments Peter, you are quite right, this won't do.
I've finally come back around to this and will send a new patch that
handles it differently - please let me know what you think.

Thanks!
Eddie

> 
> So, I don't see how this can be safe. Sure, it may very well work in
> the
> majority of cases, but it seems very dangerous. If one instance
> resets
> muxes controlled by other instances, any cached value is destroyed in
> those instances and anything can happen. Sure, if you have HW like
> this,
> then you have what you have. But I don't see any good way to handle
> this case in an elegant way. If this scheme is allowed the dangers of
> relying on it at minimum needs to be documented.
> 
> And what if the second instance reads the gpio just a few ns after
> the
> reset is released? The first instance waits for 1us before proceeding
> to give the chip some time to recover from the reset, but that
> respite
> may be lost to other instances.
> 
> What if the first instance does the reset but then fails the probe
> later,
> possibly because the chip isn't there, but then other instances
> manages
> to time their probe just so that the gpio is busy at the right point,
> and then proceeds without holding a reference to the gpio. Then the
> first
> instance also lets go of the gpio and you end up with a bunch of
> instances
> relying on a pin that noone holds a reference to. Or, yet another
> instance
> enters the picture and finds the gpio free and pulls a reset behind
> the
> back of the intermediate instances which have already proceeded.
> 
> Or am I reading something wrong?
> 
> Cheers,
> Peter
> 


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACE9A18F1EE
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 10:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbgCWJiI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 05:38:08 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34364 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbgCWJiH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Mar 2020 05:38:07 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02N9D4M0106062;
        Mon, 23 Mar 2020 09:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MzRxKaGV9xInLffLGfmDzLkmkfS8IEjkXPJtcxjqfcg=;
 b=xs5Sy3Lz+y8kPa8bBsz23uICZF+ZMg9meeI0piXrawPX5eLyZyM6y9gqwCx3KPc0Ql32
 +0cD4F0lKBsz6b0OPl25SZYFFaU3vwBxu33DrPwr8+SQq6WORZ6T1ICU8j2O72uSmiT4
 +y5/pfslipBaPBwA726gltb1PMg1JJ9vBkohyyx8TAWbHOG2pk/GjJv+ZE6d2JJ+h77m
 f1XttVM7/eBukRM789i9BsaXx4foRBOGk3u1Acu2h2il0UIjyl8hxafPLZQIoPJUJlVD
 sWN0vV2+YF/gbkHWGsGA7L0Uc15VmnZVmhDuKoaJ5UJMEKb5CVHawW4H6ShDe3OuI2qS Nw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2ywabqwjmp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Mar 2020 09:37:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02N9bubv039599;
        Mon, 23 Mar 2020 09:37:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2ywvqqpepm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Mar 2020 09:37:56 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02N9beZF029581;
        Mon, 23 Mar 2020 09:37:40 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 23 Mar 2020 02:37:40 -0700
Date:   Mon, 23 Mar 2020 12:37:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in i801_isr_byte_done()
Message-ID: <20200323093733.GA26299@kadam>
References: <0000000000009586b2059c13c7e1@google.com>
 <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
 <20200322231106.3d431ced@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200322231106.3d431ced@endymion>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9568 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003230056
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9568 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230055
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 22, 2020 at 11:11:06PM +0100, Jean Delvare wrote:
> Definitely not correct. The first byte of the block data array MUST be
> the size of the block read. Even if the code above does not do the
> right thing, removing the line will not help.
> 

Yeah.  I misread the code.

> Is it possible that kasan got this wrong due to the convoluted logic?
> It's late and I'll check again tomorrow morning but the code looks OK
> to me.

KASan doesn't work like that.  It works at runtime and doesn't care
about the logic.

https://syzkaller.appspot.com/bug?id=426fc8b1c1b63fb0af524d839dfcf452f2d858e2

At the bottom of the report it shows that we're in a field of f9
poisoned data so it's not priv->len which is wrong.  (My patch was way
off).

mm/kasan/kasan.h:#define KASAN_VMALLOC_INVALID   0xF9  /* unallocated space in vmapped page */

The logic looks okay to me too.  So possibly this was a race condition
or even memory corruption in an unrelated part of the kernel.

regards,
dan carpenter

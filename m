Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43AD952FEB1
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 20:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244372AbiEUSI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 14:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbiEUSI6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 14:08:58 -0400
X-Greylist: delayed 90 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 21 May 2022 11:08:54 PDT
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02hn2224.outbound.protection.partner.outlook.cn [139.219.17.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC9262233;
        Sat, 21 May 2022 11:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLvL4atHnsi45D3ykgl5AMG/Ce/zIvxw9uBJQGsDrkvJ6B4a8i7f5oBgul8C+T0xy58aU1+mQB8Z/kO2veOmaM8kQvBVZajhN7szpUuTUNNMMf9q6tZsNd8xF9qTtGr+2QCLx2pmU/DQLQ9k0A+z/l/MYFD4taFWzSbotEl3tE+TV7jkhNDb/XHwo72ikeoWNFhD5YXXi3t8xHex5jspfmrLyw17v7b3E7UwUD8bvxLiL3GndBynF3kR/Itg1yJJi7br1DyBSgycvTgjtdqCaGzCVqYLmRdZtNQ+61VKFUV383yfJ2lv8Fs2Dn1OELyLQeuVqakh1Y4V1271nX3o7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z5uhVUtqN5OyplYkKXQ17d4OAmlRJ8nVcEl3nfclrI=;
 b=eXSmA57GcvUX9LZBDWcU9QxHpumXmNRs9Hrtl7eqhgKKNk0XkJNt8siu0OISzT8AgPCTrEY+939gAFca0wyUHOQZTvbYXi1jvdG6Y1hcJDQIinBglZcJ1Vbtx48NzMdlF5PQ+5fEYmL5VcItkHFrK4lBP08mK843cY75AxAHINdNFQ2+MYxgX0R1sYau03ZTOVDcDXwPg0tXoaUij2px1J0YElKIVC6mrSsKE6V9DdWaIeQ6+FmJhCr1lJO8j4KeL9QUl3INktsZ6EJOnIwBg/9AcGeIgsLnRSxTDPDSBZPZPZH85pnoBIterVYXQMo73Y8Lo8TD6Ut5LaHTALm2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gientech.com; dmarc=pass action=none header.from=gientech.com;
 dkim=pass header.d=gientech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gientech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z5uhVUtqN5OyplYkKXQ17d4OAmlRJ8nVcEl3nfclrI=;
 b=KvPHzddAtK7g0KZdLd2LX6Tcv8/SIjBg+3e6bbiSPIzbKkcJsdOM4CvdWakCCeFLmEhDffL34hjIaOOUyqsH7UvqjbMvjxRsLt4CHNbA/YnsX9F6WuPtljqKmD3EkL8t1Xrsr3NahdLkKBBdqCwKkl/3O7RZaMKsKGZtKnuJc5j6t8pzWkiNkJdlC9pHPo9Hrse8LpKBPIOBGyk0S0i9QOfiE7brH9vK4jY42DFGgs51PNzZh832UDdAvEhNm7TPlz3Irnm050EvSu5aauamvFhY5Gn9clBubbHW7AHjUBb0prHiNcH9yMRWgG/AAX5xdRm+LHQTXhOvInjeA8fbdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gientech.com;
Received: from SH0PR01MB0729.CHNPR01.prod.partner.outlook.cn (10.43.106.85) by
 SH0PR01MB0635.CHNPR01.prod.partner.outlook.cn (10.43.108.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Sat, 21 May 2022 18:06:24 +0000
Received: from SH0PR01MB0729.CHNPR01.prod.partner.outlook.cn ([10.43.106.85])
 by SH0PR01MB0729.CHNPR01.prod.partner.outlook.cn ([10.43.106.85]) with mapi
 id 15.20.5273.019; Sat, 21 May 2022 18:06:24 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE..
To:     Recipients <tianjiao.yang@gientech.com>
From:   "J Wu" <tianjiao.yang@gientech.com>
Date:   Sun, 15 May 2022 12:39:16 +0000
Reply-To: contact@jimmywu.online
X-ClientProxiedBy: SH2PR01CA041.CHNPR01.prod.partner.outlook.cn (10.41.247.51)
 To SH0PR01MB0729.CHNPR01.prod.partner.outlook.cn (10.43.106.85)
Message-ID: <SH0PR01MB07295AE7A19E635A0EA490398ACC9@SH0PR01MB0729.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3457e84-16e0-4e18-63ca-08da366ff932
X-MS-TrafficTypeDiagnostic: SH0PR01MB0635:EE_
X-Microsoft-Antispam-PRVS: <SH0PR01MB0635C4409807CB2CC2766A6C8AD29@SH0PR01MB0635.CHNPR01.prod.partner.outlook.cn>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Lvi2mOIbN2xtoVlyn/sAL6+0oh1fEReVo9gVA0iMK6+fjRnHonlcTaGqKO?=
 =?iso-8859-1?Q?3p4tyS0EYDTu+jS3t1KUFX1GFhxeypbl4ZbPE7pjkxSMoakiAF7xlRsm2x?=
 =?iso-8859-1?Q?t+04ZZS/GvFw47mFRTdyPfuAPP2gZUW/2sPOz1cGwUgxPi68Yk65cMy7x/?=
 =?iso-8859-1?Q?eMxJTvCdyq4Y7B45GVgsVOTo+TXZzBgwUGNhkzZ/fw6/vVCZOZor2zG4vk?=
 =?iso-8859-1?Q?yQmcw6aByvEQgMSY7voFM6vFkPxOiEbIY4uCjTFPYIo5A7sqBghtFYGM4q?=
 =?iso-8859-1?Q?f4gxT0ayfl4puK2Wa1NpA4Rxu4NIcE49s+ylMAiT/MzpgdojPiSk+S2iRn?=
 =?iso-8859-1?Q?XrG8Fb9CVFLQd2mz5Leo/bupNvwoxOuRqWhcx733Z8d8JLf7SKB7tPE+Dt?=
 =?iso-8859-1?Q?jRb22rEiSnEhGq4jiL59PF4mm4Nl66VsQykif5pnwg870Na+QbL5DCgc9a?=
 =?iso-8859-1?Q?G9aGR2LQKMEetRAmqtxjkFWWgca1CFV4pV8/AmsfYY5c7P2ov4+stsk6Uz?=
 =?iso-8859-1?Q?KA94l0O96boBLTYfHLdZweRwgOXAJrhEK0V7Jk58MMlj9rUxwGei+xof+G?=
 =?iso-8859-1?Q?5fHkrz30RlPnWR3qIf6z/Wn84FsYvPviyFqypUmqzLOSq/r298OloFgceF?=
 =?iso-8859-1?Q?WKfGioZP+1wnmarQ3S43E2oPmWeChG97hc0m5IbuTfY+dCYkHzOjG3s2gL?=
 =?iso-8859-1?Q?k4he2x5B1BttWycvTYcdCAE4g/fpHkUd1zcj2n2mvfSx4CY+I9hogRPQVB?=
 =?iso-8859-1?Q?6M7THbnsjXFk/9ou9JXAGNxjodj1h0d5fJXpqRCsiGgTVUsoY0xs+9XXlB?=
 =?iso-8859-1?Q?NPrak+Z7AVOY8vDZ3EW0X3xX878bsOgEmZID32Kz2J0qS0po9J1KhDyzWT?=
 =?iso-8859-1?Q?mbhhRoRaVp1zP/wiqzyJDsu454PrITUcK6Q+OgxGXr7lcAdbfOe0tCAYz4?=
 =?iso-8859-1?Q?we/lfDmKvpr4e6vGTYAARl9lt1OozIsxwbE5kwhmy/AAGUK8LLXkgGssVV?=
 =?iso-8859-1?Q?rWMixvpwQRD4EUJ267PW0EJS64/o6pFU+0v12PAxUwxOpPvk672B2Lp9Xm?=
 =?iso-8859-1?Q?Gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SH0PR01MB0729.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(13230001)(366004)(7696005)(9686003)(4270600006)(26005)(3480700007)(52116002)(38350700002)(38100700002)(2906002)(7366002)(7406005)(33656002)(6200100001)(7416002)(40180700001)(8936002)(19618925003)(55016003)(558084003)(86362001)(40160700002)(6862004)(8676002)(66476007)(66556008)(7116003)(508600001)(6666004)(66946007)(186003)(62346012);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?K9GHf+QLc81TNV8hLjfOiWi5Zp9S2ugnM++UTn5G/MRwIy8+duWBMgExKe?=
 =?iso-8859-1?Q?qDUokNpQaaGfmntVqVwklAbK6kJmltCeueozt0Brsh1fMBaGPaI8VECvEk?=
 =?iso-8859-1?Q?6BBC+xuq7ynHOHYR9fDJhLUEb+OiojRyKS2YWmV5TDiQvdgvjID03PyasO?=
 =?iso-8859-1?Q?qIF15s6jLbeWsTH7oxmR9IJ3CcWQgQMI/GmUpOHyQKilqNyKkxtOovZ0ph?=
 =?iso-8859-1?Q?166LCF7tAqIF67XaawKoXZMADFhs8yaVjc/YSOM6Z7nl2XfKIptSKZJN2d?=
 =?iso-8859-1?Q?pyDTT8tx2/R2xtxaqb/ZI5UanP5syh1vV+XTOJcEbegXtoaA6sYxLayKdG?=
 =?iso-8859-1?Q?gSq6kktskFO+cY/ugo+eNJ287Oa+NjAiGWDMvnuV9uKSuaiJNZfM4y0JnF?=
 =?iso-8859-1?Q?fxF5RRoxb2b3cMp+g5TlqoNU4hlntixtZcWxmOndBTq8hzfeciViFFFoad?=
 =?iso-8859-1?Q?hNcIfbcb4c/BfG5I0gal6ZTsyuUmwbVB1r3djsyP/HEI51YvDbYq5acTdG?=
 =?iso-8859-1?Q?FYO6Zc4UKuQoAiOhT4ay6l9/upzGo9lUCWE6P3EkdD0wDQBZsV4VlVqtvN?=
 =?iso-8859-1?Q?O509LN8vz2pgHpVKP+sfXHPMqk/j+eND4g2SOgLeaXOTUPQcX9DqDu9y/P?=
 =?iso-8859-1?Q?2UcutMDTl4SEUww3CU1ti4dzwLsGP08kyWv88m7K0Yk0cmmuMNkRU8Q3oi?=
 =?iso-8859-1?Q?lgTCYKdBsCjS5VuNRxzswqGkjwUsVMzCxRLWBfdKhNtEuspkqUhVyCeUL5?=
 =?iso-8859-1?Q?FDexNIwMT6LtuGR/vBipc06KdE4CxFsKXiPcFssdZBEKRRs4clsyo6IxXz?=
 =?iso-8859-1?Q?cZQ/WMz39c+HWnpwMSoAtU6wdmFGncBf8GjCHgJnkJqmWHlnm2xYxg1BTM?=
 =?iso-8859-1?Q?75qmkWiiJUc4fJbPtCSNwHHT25eAilEri/dm+Z8jeQiI6yD+dDee8LzmKb?=
 =?iso-8859-1?Q?RZfyahv3Tu5Whj8RDbI/tgHcYGb7q/7AsMgrN8evPGSjM3QskgiYg1Od2Y?=
 =?iso-8859-1?Q?Y935jucxlfeaz4i4i7WLtzn5ZgG2TVGstpNJzdoUO9QKEkF8wYSimW+7j9?=
 =?iso-8859-1?Q?Azouo+1ICISDibIylTG2ECmP7eVuY7jOCN9VG7amJCqMR9Sc8jcau8nFsE?=
 =?iso-8859-1?Q?7vOqgkjlNsQ3IjRuqnbUBlSKZggbTFmMxPnRlkW3moIa01YovssQWRwzV9?=
 =?iso-8859-1?Q?9kKzSxPsn4p/GoiZLFvJfJsDq0xx9Ty/aIB0YOT9Tdc78LEVycITWP9TAx?=
 =?iso-8859-1?Q?p9S+3yyqvJigNpaZqzU8SQcbtTww1HgUUdUD9XMIXT1d6jG/YcCjstO+Qg?=
 =?iso-8859-1?Q?ZsSXo50iepwAwlSjoEqB1TJQ5L4qjL4AHD5Mtxa7ihhj9oJEHct4wr1RKm?=
 =?iso-8859-1?Q?fZzYUwAj89tsIMHYlTbpcKIf3urCabb1kJl1M551EKmp/XbV5eYY03gX3J?=
 =?iso-8859-1?Q?frD8xsuW+9NmanjzJbxv2DgKN19S30D3X7IAt2cYL1zIFXtkaPExrGRUfm?=
 =?iso-8859-1?Q?wRXK/G4ED0T3FjltFAhcvouf5wgCu0SmILxzsQQ2y1454cszwCOwO7AWmY?=
 =?iso-8859-1?Q?b/OrGjIyFlJcb8SvXVX0goRY+e0GyCXcI0P7akYbBhFVM/hVDgZ4s6+MsN?=
 =?iso-8859-1?Q?UWuGx+FN6jxfTNHTyCTfXGyYiMtwQy0QBJxjOmt2RHeRAm+bkUkoAL3rmU?=
 =?iso-8859-1?Q?h2+Jr2nJZTJ7K3uGTjPnKe3M/UL85xiBts8RyWcRCOEBrDjgJJo8Al4/SR?=
 =?iso-8859-1?Q?alYTWVUQ3r8V36DvCMFruj20I=3D?=
X-OriginatorOrg: gientech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3457e84-16e0-4e18-63ca-08da366ff932
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0729.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2022 12:39:37.7539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 89592e53-6f9d-4b93-82b1-9f8da689f1b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Gb+ie0ayQs7p608ELSOdHPVldU8gmKUrG+jU8eLthI2ELCjrBiXSlZa+yATNSecx5b0YJRsXNdt0wTuZZVSyMMEy42YWoCFvivc42+jJ3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0635
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DATE_IN_PAST_96_XX,
        DKIM_INVALID,DKIM_SIGNED,NIXSPAM_IXHASH,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4895]
        *  3.0 NIXSPAM_IXHASH http://www.nixspam.org/
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before Received:
        *      date
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.1 DKIM_INVALID DKIM or DK signature exists, but is not valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Can we do this together

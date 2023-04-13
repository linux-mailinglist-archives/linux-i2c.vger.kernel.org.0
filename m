Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2260D6E12A5
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjDMQqP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjDMQqN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:46:13 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838ACA267
        for <linux-i2c@vger.kernel.org>; Thu, 13 Apr 2023 09:46:11 -0700 (PDT)
Received: from localhost (fx305.security-mail.net [127.0.0.1])
        by fx305.security-mail.net (Postfix) with ESMTP id DD7F930F79B
        for <linux-i2c@vger.kernel.org>; Thu, 13 Apr 2023 18:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1681404368;
        bh=e7wUi4mc3TwCsUMSuEjMHiV+EmAdxJozU/xynxv1Vbw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=BN3Lp33sKlyyoG7bdKRLYwpqCNIkM+KjEh1mgLnj3oNXOqXr4vQ8wNZ22hvLrV5SB
         uatuNRC4xWmyOV7JF9YJQmV/+9GAv0YZVxdDwEvdidnvGy9XudeaWgU73PKzn7WyAU
         /2ngO44GFvHVt6zxiAh3CSLTfDEKA1EOFUXr0pAY=
Received: from fx305 (fx305.security-mail.net [127.0.0.1]) by
 fx305.security-mail.net (Postfix) with ESMTP id 9F44430F6D3; Thu, 13 Apr
 2023 18:46:08 +0200 (CEST)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0109.outbound.protection.outlook.com [104.47.24.109]) by
 fx305.security-mail.net (Postfix) with ESMTPS id 0077830F48A; Thu, 13 Apr
 2023 18:46:07 +0200 (CEST)
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::18)
 by PR1P264MB2159.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:46:07 +0000
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832]) by MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832%4]) with mapi id 15.20.6298.030; Thu, 13 Apr
 2023 16:46:07 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <1d2c.643831cf.f38cd.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee1k7ngFJXTYCSy5WDm4XhH/SA98NW0Pi02KY+iTnQ4A0DYynqCfwem6VHAZKuW/J+d6Gx5Axb1bcCrNBQlm1KDfX6GuV+K0m8+p3zoOk5VYiKV5u3l19NCaCSb2TodUOS7OQpJNJkmSX/Bbcqff3AfjMEeMvK8VYbkGkX9bf3R23yQL2lNvSZkfq3O/UsKlh+jeTbCrrYhcR+M0kR5JSoV3rjT+bsbso9bV7qd8K+Fdti5m4aa+DlJgoqIwmAedvSVw/TrAypch0vod2IYKA69Mv5jX9SbMrbiL3Vo777FsLNHOb8IT3XTD4xqIZtipF/cyrpjB3iBx0omHWWCH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7wUi4mc3TwCsUMSuEjMHiV+EmAdxJozU/xynxv1Vbw=;
 b=fRCm12EJ+gjwKXMcW8yDppE2r2DJaDTWCMceAxzXQw3HkZtE46WHFJVk1s58OFheNQQwEBjY9qcsheqDd9WKslYIoO97E1e7pfFozQGEMHe8oEpovcyawDNeY/XNKVAQdkx5nCiPJNH0Mw5DOgdxczMCm7Se+B1HZlhIZ9NkwX3PCVYDp5PcDlyNQyjz0J5EK3pkq/+htCNkdRgNXD8eM9f0rODFyXFRDseNoGtj89lrBOZ3EYewJXb2yhrnov8MpuV9w2vCnjUqR3kG9vhwxvSFHofL3OS2Zhu1blU2JCy9bGpYYD5T3Ju34D45rh89ymW2LIxd59Jn8zV+xxhF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7wUi4mc3TwCsUMSuEjMHiV+EmAdxJozU/xynxv1Vbw=;
 b=dm7FQRV6SZAaqCvCKz/WPnqN5MYjmVPVGxicd8Z7S//WK9nPlDWDuMA8hB5fpnI+QgzbpoBYH6HFAq1DcNeFgGJQub60onPTLREyURKha1eD7MshQNnsG/++RTQi+8ZoUYAYTELHCa4dSZZ466aRmLR3cfnifa8ZgqDahIFleCJP06Gk+/xsyCBy9muOxIZIeFqOopQKD3n1FPb9Qe3YyNuULPajZ8tgf1bpEvCpQJ8JHqCOT+gDxS9y9/V7es3DH175gjPnIzFgJbPuG2v3zUkZe4hnVrCcP1pbaCHRmbZ8pZAO+DstThmQJefTirGPTx60wGDaXDcxnZONszQbMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Date:   Thu, 13 Apr 2023 18:46:04 +0200
From:   Louis Morhet <lmorhet@kalrayinc.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     gupt21@gmail.com, jikos@kernel.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fixes for the mcp2221 gpiochip get_* calls
Message-ID: <20230413164604.GA17941@achlys.lin.mbt.kalray.eu>
References: <cover.1680602387.git.lmorhet@kalrayinc.com>
 <20230413144913.53a22nat4s6i2mib@mail.corp.redhat.com>
Content-Disposition: inline
In-Reply-To: <20230413144913.53a22nat4s6i2mib@mail.corp.redhat.com>
X-ClientProxiedBy: LO4P123CA0465.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::20) To MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:15::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1555:EE_|PR1P264MB2159:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fd6a63-b466-4ab9-1779-08db3c3e939b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLOggepvdfa527gpae4xzYWASLST93tT1Rf41BMD9gO4VtK7owqcsnm7ipBfmuMm8OF07NPHbTOam2f3vpn1cXphWkZ2R8avCEv1BfjmNfMTXB0OVlPPml8eNKBbSB/vWEiJAdEUWwylWcAAKJXiTP6JqnYfUFcYR9J6xHhdZrVaP/0eqjL5TAkNE01CClSNYh54JSqEqCstoKzHv05JcF2a/jQ7YKkaisTkHsIZqblEdFKqf8DByQuUK7w/+hB4lbt3XGGkapu7pkVDvNAkbXpdI2QodGLNPmG+1f09Olv4yaA4Qi3jxTCq9WTP48hNfB1PyvGkCSAUt72wJFYtyvoZovOPfeQ6Cm3/lUitNSODWHFWFrrjlCkXEsu9fhISBNrmj0Jlkz+VV8jrksYs1Z3uStAUcE+4arKHjKPFqTazKjNHbM/atbqLX8rhuoDSKTQb4/NMMLKlPJ7Zputn06yId6g/NdtAwGlnaNxg8G+jx5OwvgPNBMIsl8tp60JY+cTUBUlJxRXKJ6dTmLjpTq/NsO2JCeh2GHFypC/NG2NZgeFUMEyyFtuwEI904wqB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(39850400004)(346002)(376002)(451199021)(5660300002)(41300700001)(33656002)(38100700002)(4744005)(2906002)(8676002)(86362001)(4326008)(6916009)(66556008)(8936002)(66946007)(66476007)(316002)(1076003)(83380400001)(6506007)(6512007)(26005)(9686003)(186003)(478600001)(6486002)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PO8atFpZk+tcl/5jJJEP5q5uHsbRIByead5WyqF3H80f2cuivK1sRqseFixm6DaqRUAltJ5w60O5+dK0w92Yuoc46Whe4lK6GmbAkJr0YJojoRW+weA4XiYj5eFFC8Fbin0lSyqGTBd61upphRsDAb3NOFXYAmSDFSJniR5CcCney1FoZHMV2Z+HhqRnvS5uJJnO73aeeX9H1FrRJaQCvUZUjbhiRoFL8TW+0ruBKoa0du4eilXg581nN5Khuskhh7JmnOVeaExe0+zsQWfePqsrl2I2gDP0ggUStAmhTMb/tYOGQJPMUhZ/YizodjnAnwUdaWcnPT45TB8X54dQwei+zhyyRFQCHBJ57IDhJKLwAq0LTNzpkYMf0nyaV72BnepSlW1qGcKuGKqx1LxNBKH57aSd2a8y3/qge/0u/aHYMqjSphP8GBhihh0OvViSbBJ1NYrubkBUk21qc3LGO9YhGo+Z9wVBNgstmGIgS5UpF+/U5ivOLszGul29Oyj3T+Y8iPJwYVqPiY/ouPE4jLnMia5xkAFLxfzeBaDSNzDbu4l9eZ6OxvoyEYTdh1nO9m0SaAT5aoFvx5HSydt3NASQJj4w3zHlErkcq93vdAydxnPShPnTX9H45eHDZO+fimbAnN0uLAw4coOkkiFRtQYRRUNCUYXcOfi7IcIjxU+hfLw9b5W8w56Z8MEJUsiXxRs7gJ2mFnaGUYvi7OnBK/mS5K1YE38HUYtDhr/OWbWr1GAsAE82MJvDhbTUDWfTBkM0KtsVZtpBZNTH+JLzYxMRIuz65OCHNSr15i4CwS33CDlc4UA4HL4UnfkNkj7HOxVne//DhOh3Sfqs3C1RPjJN4cX5xjofNFAZ9wmeO0R17BFuv/yE3dSmie/1xTmqNwE1ijqeOrNDDQqtR4i05dn46+KqgUmBJXwSnuhUfazAbbhVtzm/+Lh3N+jIwFm/
 Q6+rxSgwGHMEEKoeHtaGUIomropOxM6z3pCpN1HFcSnc7C81inHB64e4KFB0LnQ8+Dn+4rgjcqHcuWmI3iDAm2+3/clN9cP15lbu+Rdg5WF+wE+LXxjMSE2gne5iI9N37wMM3XVWd0fbDHKdMyKWtpV5WJvZIw7Wy17ndWwIddnvajxETyEigovKtGZbqSbVE48cJpFKZY94BlZCr7UX6ElrcozJred5ite2Sh6CEeQ9C/7rk6X3s1bkv38E5pZdUVeZrhJ0Hmc3b1VxyVo0rIvUS+mLKaJJ2iCbmgipajAeBAcEZcs3tAfY8NiZKTC7Z59+jKkbLRhFwTa2PumIDTtStVT/BXT3/mw1QEhzpYMs2sRUD1lEDdTGOrstKb7BLANEoWuEdSlSr4SYPp3P1azYJkEH05cvKN7wfNYHktlB+5ShkzD0fBB/KlRysVKUS4CdllIEvDhOZeUYGLv8xfvNZ5tlymQZJt4/XnZHb0S9QhWUfvQ4R3Ips2OY/Uhe4xgi43NnxztSmkUQLkOWciYH/dIzVp+BFHEw16MgHQY33x2MVWCii2rU2NGFZLJsoSRUZkDGtg23lrfbPEfeTsuGSqLoRua1/0SyYbe9pp78ZnyNK/gu3n5pU6Ep3FGF
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fd6a63-b466-4ab9-1779-08db3c3e939b
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:46:06.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAD9Aj7cge0+wU0PWhkF0WqiIzyezr5i+4rvv+oq4eOpD7tophLE34jCBi51hiEEBwjvCStHQ1IaNjHN7jUgsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2159
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 13, 2023 at 04:49:13PM +0200, Benjamin Tissoires wrote:
> As you should have seen in the automatic replied, I took that series in
> because it seems to fix a rather worrying bug.
Thanks!

> Also, just a side note, this driver is very limited in term of scope, as
> it only touches one dedicated device. Which means that whatever solution
> feels the more elegant to you has a good chance of being accepted :)
Well, using a struct to describe the layout of a message seems more
elegant; but if I'm not mistaken, taking offsets of fields in a packed
struct is UB... so I was surprised to even see that in Linux, that's why
I was wondering if I should pursue in that direction.


--
Louis





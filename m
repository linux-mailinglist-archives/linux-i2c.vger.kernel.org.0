Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55BB673E5F8
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 19:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjFZRFn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 13:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjFZRFl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 13:05:41 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE56E75;
        Mon, 26 Jun 2023 10:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+rTCkvGW/qSfefXVmJ+Gn/uH7Ml8fFg9Ai14i344utuHQ7+dYxQZjEp2rMdOjKjsMjEGdOTJ5hWKaSnnigqxiFT9CBGK3l1SIfSyLZrlA0/dsXAeXWgFwfob6sFjBHJjw5ubZcB7bDmFwwSX2XGMSwK4HjIF9RecX0s5pRdVzKXY8GoX+EXK81SIeQsq/6yc7xLhOfajrCOyKBV78NNq/vezl9U0lQQBSd7HAAaIotC/6HuPml+vgKtBpZJfUK4A0JntR6yQf415Mtrypmnk1jKOJc65VUzEg4xhnxb5yK0YijQZLJvIE19RZd02v31XSTGHmEEwKCqu/34tcmFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjTLAYbFaQZoVDsQ5C7PM6CRBJmLCDoCezynJf4iiIk=;
 b=ibUMCKdnSvM4x84SYxtOC144E9RrGJoPF/GLteqn6aBAJlQAoeiTdT4K81+RPhcmtwVpOnSWJ5OkYnDV/N1VY+WWqT8Tt/QSkk5Mh6hylqNJaORHSFmmHs32zUJzWBSYdIOxKI3jTwBxo7DCdH3CZ5xBhOahBFmwb9EzesJRKjlRg4KHSy+UfgQRXd1byVNI16PUpTqC9E7kwuQLeQ+LujKr0Q4IJPG67TQ881ssyi42e7zbfeqZFH5+0EMcymweth/Nb7XuvtRDgN4QJHCgTDhlZReh4YTjEsHctf3+psLHCdrUzs0gbZ3KawZArkWuvHMhlgQIWdI9beBW/rsYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjTLAYbFaQZoVDsQ5C7PM6CRBJmLCDoCezynJf4iiIk=;
 b=RTX+pLtiT8MeCWyjRRZMFknQHuROq8fqt+ppvltB6/5kjp1SGlqJmkqfO5dccXatfCsnF1X4dyBCkfqiS5SInd3hsAAmuxnfOYu4nPL2R71HABfY+3ZrQAqo5MiuRJqtPB2a/Cli+LTLqMqAsu+8W1TxbNQ6KTvHoiO6lf0HLrg=
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYCP286MB3316.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Mon, 26 Jun 2023 17:05:38 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 17:05:38 +0000
From:   YE Chengfeng <cyeaa@connect.ust.hk>
To:     Ray Jui <ray.jui@broadcom.com>
CC:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Thread-Topic: [PATCH] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Thread-Index: AQHZptF4vW+xYGiqv0K3I948JeZ3Oq+dTM2AgAAGaoA=
Date:   Mon, 26 Jun 2023 17:05:38 +0000
Message-ID: <60931201-FD2A-4579-861E-E9573B7C2B38@connect.ust.hk>
References: <TYCP286MB1188708B1CE64D95FBACF9E78A20A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
 <b68ad6c4-f5e6-9bb7-0ac8-2cd08ce04c7a@broadcom.com>
In-Reply-To: <b68ad6c4-f5e6-9bb7-0ac8-2cd08ce04c7a@broadcom.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connect.ust.hk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCP286MB1188:EE_|TYCP286MB3316:EE_
x-ms-office365-filtering-correlation-id: bd4d9079-0622-413e-5ca8-08db76679093
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pAr3AuRzlxYtx6iK22/O2F0QwNSZXOwsjxvQCJsG2wJcsdbqT2MUdEBi8KrmWoF9A/k3w3TOANovV4rOzHHlzU/+OnS4iTlVwBjAp2RvVKOasomYSos7HhTSwDOBR8gcj3cPMsi9z8mJU66kryBHOmqOHDEiqRyykMFzTZDPY879ALYXkciEa+snwZWVqCTAygzEVNB4eZ9JYK96WKjJHIJYRRH4jnOor7UyHPoH9IbosS7ZVVSI2HedpVEkvw6a0NiqQxT8rNOLuOcjwG5qo9ZDZYJ9im+VGChvdF2w4qckzPe69abDBRtmpMb7kwU8ckWnRPCWr2nG0xOOgBckDzGqn8qVH2PmA97GCMTCCUW/d/FDqxGUbzVHHlEfGW+/mTy6sB856nP7GL85INv7gRk2FiHl4rJjvuo2JSBJ6tFWra3STjPfzjcc4huiIYlnvEjnEexBksk1njuduTwju7nven5Chugb3XMo8ORrjMm2BZZ4UISN++ChPxfUBrwuvM2tRyUzVHe+v9wZQNG2UNuYlKy82XL/nifPRtr/wnADXKqM4ihnjp/tevsDU68FGnh3COwQduW9NYom7lAW4MEACa81lpMCkOZQaFG3Q9n9kG3z0sj42yY9kKGrH+C3StaBtwYivvFNsOcOyyCKmvHjfXVOA4wcOdKUApNG1P2caKFp2g8WTILRWXlKebDX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(6512007)(36756003)(33656002)(5660300002)(41300700001)(86362001)(6916009)(66556008)(8936002)(8676002)(66446008)(38070700005)(64756008)(66476007)(4326008)(38100700002)(122000001)(76116006)(316002)(91956017)(786003)(66946007)(6506007)(2906002)(26005)(186003)(4744005)(71200400001)(2616005)(54906003)(6486002)(83380400001)(478600001)(70780200001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GFK9xhZrIbkDore5Tkkx63PTru8md2er1/KrQ4/puvDQharr4GYUfHTq8kLs?=
 =?us-ascii?Q?dOOektmj054KmAmvy9XfhiCoeOSU66Xx4lZaxaYPsa7X37Dw2JG511vbhXFw?=
 =?us-ascii?Q?cbjt8f99qMGAR8aFFNSzk1QKlKwKIlb48QdLmanDy8L3dwM+Co1ZBruk8WuQ?=
 =?us-ascii?Q?RbavcRbCH0k+/4c9o0TfOsNsRvPoaja/2gnIsHXO9Lmkx+HTl1L0qQwwra7n?=
 =?us-ascii?Q?1fx5YkTH1QF/2o71piL+Wlel+iqPs3kVdV/KKs80GmtXp8qrzTV2/XoyU9g6?=
 =?us-ascii?Q?DF+SYC3kDRJfFJeW0mNj/icYz0VQ55uKYQAuiY+Z1yFNMpA2nT9Mkjbb6tz1?=
 =?us-ascii?Q?PbLrKWsRTOkhvdKeYVEdETz76ir7ifu52DbTanAAMUB6H+rzZ50arI9XTQuu?=
 =?us-ascii?Q?NdXZxPp0D4M9kOWWBGfh5N3K1sCUTsV0j/3d0+0uk/Hx1+ukJ5e0Oooqtu0q?=
 =?us-ascii?Q?1OWe039ZXktGDfQY/bBo1eEoYmDqMJnDpr0eDl9o/aqs2xCXQ7UUyVaW33ev?=
 =?us-ascii?Q?L04R3iC8wdo2P1QGQW13pWNKUFQhsgq0KhHfqPOC1DFPvLj/fQyxVpaIU1pC?=
 =?us-ascii?Q?2tFV5/4u2GvyT5mDc//0w9TvPVDz8/JXlx8DgTKi+/Lhtw4rHmp0co4+ckDG?=
 =?us-ascii?Q?PEZ3f5h3kQ362DRbB1AjofQjUCZSF+ckyvY9YN5od3bvy36gl+b1PfNNLscR?=
 =?us-ascii?Q?/YWOvBtm+7j8jLSu3tAZQjxSVJF9HZI1v2WrhZlGqCorIyObYT9lCIst4Qr0?=
 =?us-ascii?Q?wkmEgor1v3hKHES2es7gXciD/e4p/rGc8wMNKYMHyK6hOw1NI4NHDm3eYWfZ?=
 =?us-ascii?Q?Vvtqv/g64OweDO9qik7P9/EGrmicgyZMtJikZgfWvJDjnkR/inIRNxctxhqM?=
 =?us-ascii?Q?eX3BCWIEyRtpKaeOS5HfeGskjNLu8TmpyiQkb+xOLxuT+fMQ4MwmDQzdJyxI?=
 =?us-ascii?Q?WBzkWQeP6xOKJ7kgspLf4p7xeZU1N7880cZlfyge9QsyxQmQDGTJLZuOhmVh?=
 =?us-ascii?Q?tuiwm7+hgTH4acR5/tFGvWw1tdtSQpz9yJtU67WHbGnxSzX7MCuCwTkQ0dOh?=
 =?us-ascii?Q?R46gRjfcdztzVoaLfMh2HXw3+yJxNMYMbAYRvBME+KTxAlW7Sn8vXIPunFIn?=
 =?us-ascii?Q?EPOG6w74RViDguHKnuKB7gtwSGG792OtzWjDBm5Sh3kbl367/ifiLUd6ibhB?=
 =?us-ascii?Q?8Smc8AMb/q67h+v01mOfXWVnby+eKyOmN9qnfBip+Fv5UvZ6+XFEh+Yr67lX?=
 =?us-ascii?Q?V6xGnqS9aOWMwkCogKKfk+kecM0H+yLsMdyCV76lY5lx7/QhohSIra1oj6hf?=
 =?us-ascii?Q?U260CowSNWdbtL3nij3tMQATjfFHGlCK3w0UZLeqeqd2TnwOSTaeXj2jgQgT?=
 =?us-ascii?Q?OxPrM9hz/Yz4bhHFt1vfodgxtNvrjjfvg5ej1Y1qn0gkO473muTvEgU2TN/w?=
 =?us-ascii?Q?cN1NCoHOvKofBRHK2Q49XEEHcIwrasRybtIRc9LVExskBwOKxTV6MfKNozvo?=
 =?us-ascii?Q?jo2UwXytB2k1m0oZlPROY42SGZvP2MY2bZc1bSGjTB+ORF4RzuigLLCDKj38?=
 =?us-ascii?Q?QjuO7mz1p/l1zNitcH6FEhuIfggfVUSONzriWqnTTMamFzXffUNUsP0O73Nt?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB8BF4FE45D57B40BAE48B34491335C6@JPNP286.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4d9079-0622-413e-5ca8-08db76679093
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 17:05:38.1739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rUWHogIIQE9W50d15/hJzQQ8f1rPSI825rITmnNUhH4G9ONK36ikD9lQENLT/EkZ2X1CanL9BofqcNYwL2JDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3316
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> This fix looks good to me. Thanks. Just curious, did you actually see a
> race condition issue as a result of this, or the fix is done completely
> based on the analysis of the code?

Thanks for the reply!

This bug is detected by a static analysis tool built by me, I just notice I=
 should=20
mention this in the commit message and sorry for not have made it clear. I =
noticed=20
lockdep occasionally reported such similar deadlocks in other place thus bu=
ilt the=20
static tool to locate such bugs.

Just feel free to let me know if anything in the patch should be improved.

Best Regards,
Chengfeng=

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A724254A06
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 17:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgH0P5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 11:57:40 -0400
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com ([40.107.243.46]:53857
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726266AbgH0P5j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 11:57:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhNl/lEftBMzTyKruh6ThZNYJ8Y9vKBLJ20IP9ZSXINpci327t1eaitcO1FYm7MfXDAFDVwocKwhRHcSYbEyKdzVrzljsdl+KCM4ehWlZXabc1g9YFpaJL314kHq9jUVZ61Skeo6QN0SDGcdqyvUiBzcY2eoOkWExYk8GfVzLjFVeN71aMY8ceyG2twtchpjvjyTGFGU49JbTmFAZ4FnVojwcM0EsslhnHzoBlmTLSmc+PWVhiCOq61eTnL0pQydDSyIBm15uUbfiMdTeM7rCUNx6JFePnI56BP6TSWd8uMKSKO2TIAFv5ByQBl2lO0Yy0nmSIzxbxOdCuZeU5ZcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9lCXOtsoNUkx4AEULiuRniJztXWMLTYjA1XtcpxU7M=;
 b=ZOHSOmVTHeFHK1Uzoocb7LJbrxPfM6iGRu4HvZtBej+bFEsGb1bNcQvdg/xquG2TsvlkzeDBCR9VV3gBzdrpmMrcrTiRr8OqoaHodi38MCBJxIBM64JmgDv4ipVDIpDX43+5vO9nDSieaXj+u5Gr0kELQTT4mtr0g9kCcgDwFXkifDHuSI8RT24IerL06/0I5Mr+wHVar69/iAmerlyE21rz/yrf23jXYqV7Jr4aLkCxg8JFiCaZLcHJlWqbSvCsogwQ6ST257xHpvBjZRxdFusF/ex1tkszuSxEdIMF3yrmvpy5kR8n69Gcz3VdvEYsxQf7fFNF2afE01U6ZsJPNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vaisala.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9lCXOtsoNUkx4AEULiuRniJztXWMLTYjA1XtcpxU7M=;
 b=MIJiFjzlw6Mn4L1m7QwjJOhtOUcAUeBSQH2Wp2aggHbeW+gUs2TuR6qvyUZJEPw8xKZsBIKCVjzz3BAT4iKVbA2a1PVVQ9zgNxXC9ek6vCxTM1spsBfrQJKHWlPB97CaFXGWZp7CvHzg2YJGjy4/GA57qwMWV+anPXqw5UrhNNI=
Received: from SN4PR0501CA0106.namprd05.prod.outlook.com
 (2603:10b6:803:42::23) by BN6PR02MB3377.namprd02.prod.outlook.com
 (2603:10b6:405:6c::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 15:57:00 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::11) by SN4PR0501CA0106.outlook.office365.com
 (2603:10b6:803:42::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5 via Frontend
 Transport; Thu, 27 Aug 2020 15:57:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vaisala.com; dkim=none (message not signed)
 header.d=none;vaisala.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 15:56:59
 +0000
Received: from [149.199.38.66] (port=54875 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kBKGJ-0000x0-1q; Thu, 27 Aug 2020 08:56:27 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kBKGp-0000yW-Jv; Thu, 27 Aug 2020 08:56:59 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07RFuu3U032143;
        Thu, 27 Aug 2020 08:56:56 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1kBKGl-0000xN-Ic; Thu, 27 Aug 2020 08:56:56 -0700
Subject: Re: [PATCH 2/3] i2c: xiic: Improve struct memory alignment
To:     ext-jaakko.laine@vaisala.com, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org
References: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
 <20200827144848.12107-3-ext-jaakko.laine@vaisala.com>
From:   Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzR9NaWNoYWwgU2lt
 ZWsgPG1vbnN0ckBtb25zdHIuZXU+wsGBBBMBAgArAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIe
 AQIXgAIZAQUCWq+GEgUJDuRkWQAKCRA3fH8h/j0fkW9/D/9IBoykgOWah2BakL43PoHAyEKb
 Wt3QxWZSgQjeV3pBys08uQDxByChT1ZW3wsb30GIQSTlzQ7juacoUosje1ygaLHR4xoFMAT9
 L6F4YzZaPwW6aLI8pUJad63r50sWiGDN/UlhvPrHa3tinhReTEgSCoPCFg3TjjT4nI/NSxUS
 5DAbL9qpJyr+dZNDUNX/WnPSqMc4q5R1JqVUxw2xuKPtH0KI2YMoMZ4BC+qfIM+hz+FTQAzk
 nAfA0/fbNi0gi4050wjouDJIN+EEtgqEewqXPxkJcFd3XHZAXcR7f5Q1oEm1fH3ecyiMJ3ye
 Paim7npOoIB5+wL24BQ7IrMn3NLeFLdFMYZQDSBIUMe4NNyTfvrHPiwZzg2+9Z+OHvR9hv+r
 +u/iQ5t5IJrnZQIHm4zEsW5TD7HaWLDx6Uq/DPUf2NjzKk8lPb1jgWbCUZ0ccecESwpgMg35
 jRxodat/+RkFYBqj7dpxQ91T37RyYgSqKV9EhkIL6F7Whrt9o1cFxhlmTL86hlflPuSs+/Em
 XwYVS+bO454yo7ksc54S+mKhyDQaBpLZBSh/soJTxB/nCOeJUji6HQBGXdWTPbnci1fnUhF0
 iRNmR5lfyrLYKp3CWUrpKmjbfePnUfQS+njvNjQG+gds5qnIk2glCvDsuAM1YXlM5mm5Yh+v
 z47oYKzXe87A4gRRb3+lEQQAsBOQdv8t1nkdEdIXWuD6NPpFewqhTpoFrxUtLnyTb6B+gQ1+
 /nXPT570UwNw58cXr3/HrDml3e3Iov9+SI771jZj9+wYoZiO2qop9xp0QyDNHMucNXiy265e
 OAPA0r2eEAfxZCi8i5D9v9EdKsoQ9jbII8HVnis1Qu4rpuZVjW8AoJ6xN76kn8yT225eRVly
 PnX9vTqjBACUlfoU6cvse3YMCsJuBnBenGYdxczU4WmNkiZ6R0MVYIeh9X0LqqbSPi0gF5/x
 D4azPL01d7tbxmJpwft3FO9gpvDqq6n5l+XHtSfzP7Wgooo2rkuRJBntMCwZdymPwMChiZgh
 kN/sEvsNnZcWyhw2dCcUekV/eu1CGq8+71bSFgP/WPaXAwXfYi541g8rLwBrgohJTE0AYbQD
 q5GNF6sDG/rNQeDMFmr05H+XEbV24zeHABrFpzWKSfVy3+J/hE5eWt9Nf4dyto/S55cS9qGB
 caiED4NXQouDXaSwcZ8hrT34xrf5PqEAW+3bn00RYPFNKzXRwZGQKRDte8aCds+GHufCwa0E
 GAECAA8CGwIFAlqvhnkFCQ7joU8AUgkQN3x/If49H5FHIAQZEQIABgUCUW9/pQAKCRDKSWXL
 KUoMITzqAJ9dDs41goPopjZu2Au7zcWRevKP9gCgjNkNe7MxC9OeNnup6zNeTF0up/nEYw/9
 Httigv2cYu0Q6jlftJ1zUAHadoqwChliMgsbJIQYvRpUYchv+11ZAjcWMlmW/QsS0arrkpA3
 RnXpWg3/Y0kbm9dgqX3edGlBvPsw3gY4HohkwptSTE/h3UHS0hQivelmf4+qUTJZzGuE8TUN
 obSIZOvB4meYv8z1CLy0EVsLIKrzC9N05gr+NP/6u2x0dw0WeLmVEZyTStExbYNiWSpp+SGh
 MTyqDR/lExaRHDCVaveuKRFHBnVf9M5m2O0oFlZefzG5okU3lAvEioNCd2MJQaFNrNn0b0zl
 SjbdfFQoc3m6e6bLtBPfgiA7jLuf5MdngdWaWGti9rfhVL/8FOjyG19agBKcnACYj3a3WCJS
 oi6fQuNboKdTATDMfk9P4lgL94FD/Y769RtIvMHDi6FInfAYJVS7L+BgwTHu6wlkGtO9ZWJj
 ktVy3CyxR0dycPwFPEwiRauKItv/AaYxf6hb5UKAPSE9kHGI4H1bK2R2k77gR2hR1jkooZxZ
 UjICk2bNosqJ4Hidew1mjR0rwTq05m7Z8e8Q0FEQNwuw/GrvSKfKmJ+xpv0rQHLj32/OAvfH
 L+sE5yV0kx0ZMMbEOl8LICs/PyNpx6SXnigRPNIUJH7Xd7LXQfRbSCb3BNRYpbey+zWqY2Wu
 LHR1TS1UI9Qzj0+nOrVqrbV48K4Y78sajt7OwU0EUW68MQEQAJeqJfmHggDTd8k7CH7zZpBZ
 4dUAQOmMPMrmFJIlkMTnko/xuvUVmuCuO9D0xru2FK7WZuv7J14iqg7X+Ix9kD4MM+m+jqSx
 yN6nXVs2FVrQmkeHCcx8c1NIcMyr05cv1lmmS7/45e1qkhLMgfffqnhlRQHlqxp3xTHvSDiC
 Yj3Z4tYHMUV2XJHiDVWKznXU2fjzWWwM70tmErJZ6VuJ/sUoq/incVE9JsG8SCHvVXc0MI+U
 kmiIeJhpLwg3e5qxX9LX5zFVvDPZZxQRkKl4dxjaqxAASqngYzs8XYbqC3Mg4FQyTt+OS7Wb
 OXHjM/u6PzssYlM4DFBQnUceXHcuL7G7agX1W/XTX9+wKam0ABQyjsqImA8u7xOw/WaKCg6h
 JsZQxHSNClRwoXYvaNo1VLq6l282NtGYWiMrbLoD8FzpYAqG12/z97T9lvKJUDv8Q3mmFnUa
 6AwnE4scnV6rDsNDkIdxJDls7HRiOaGDg9PqltbeYHXD4KUCfGEBvIyx8GdfG+9yNYg+cFWU
 HZnRgf+CLMwN0zRJr8cjP6rslHteQYvgxh4AzXmbo7uGQIlygVXsszOQ0qQ6IJncTQlgOwxe
 +aHdLgRVYAb5u4D71t4SUKZcNxc8jg+Kcw+qnCYs1wSE9UxB+8BhGpCnZ+DW9MTIrnwyz7Rr
 0vWTky+9sWD1ABEBAAHCwWUEGAECAA8CGwwFAlqvhmUFCQ7kZLEACgkQN3x/If49H5H4OhAA
 o5VEKY7zv6zgEknm6cXcaARHGH33m0z1hwtjjLfVyLlazarD1VJ79RkKgqtALUd0n/T1Cwm+
 NMp929IsBPpC5Ql3FlgQQsvPL6Ss2BnghoDr4wHVq+0lsaPIRKcQUOOBKqKaagfG2L5zSr3w
 rl9lAZ5YZTQmI4hCyVaRp+x9/l3dma9G68zY5fw1aYuqpqSpV6+56QGpb+4WDMUb0A/o+Xnt
 R//PfnDsh1KH48AGfbdKSMI83IJd3V+N7FVR2BWU1rZ8CFDFAuWj374to8KinC7BsJnQlx7c
 1CzxB6Ht93NvfLaMyRtqgc7Yvg2fKyO/+XzYPOHAwTPM4xrlOmCKZNI4zkPleVeXnrPuyaa8
 LMGqjA52gNsQ5g3rUkhp61Gw7g83rjDDZs5vgZ7Q2x3CdH0mLrQPw2u9QJ8K8OVnXFtiKt8Q
 L3FaukbCKIcP3ogCcTHJ3t75m4+pwH50MM1yQdFgqtLxPgrgn3U7fUVS9x4MPyO57JDFPOG4
 oa0OZXydlVP7wrnJdi3m8DnljxyInPxbxdKGN5XnMq/r9Y70uRVyeqwp97sKLXd9GsxuaSg7
 QJKUaltvN/i7ng1UOT/xsKeVdfXuqDIIElZ+dyEVTweDM011Zv0NN3OWFz6oD+GzyBetuBwD
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <d5bf8900-6b76-8bf4-5bca-b4e4cb16d9f2@xilinx.com>
Date:   Thu, 27 Aug 2020 17:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827144848.12107-3-ext-jaakko.laine@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c5a8b71-3422-4ab2-d932-08d84aa1d52a
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Antispam-PRVS: <BN6PR02MB33772B95B2586D4184FF134BC6550@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hpukh1v41qZcJv1P0xn0oGDfEXBBac/6DyA9AiCtDJv4abpoKmD77PrpBCRcUwXah4UHyZXgYDdouPEMS42EJW+wB8ZZf5HN1nh1ce9xVZgsGdATQhrvz0F+58NvstyzkAAzH6Xbgocasrls3VPxUuCrMZ6Ea/6tE6f8Fx13P6wvM66O/W84LySeCrkMlkh0MTTEBIbsbp4Tvr1tLcA+WjX7GGB97/n8rFDGXekhifd47tWk8qHiz4xXea5Hn1vJd9qw1t4H1YKKGCn/WJDAT1i7dv3Y5lSN+oZ+nBHrSNGGEhM6irlIyQvQSMtf7qUQqGpGUgs7nY4qjgBle/2Bl5HIx0YVQcbVsDiWizDK7bzcXwe145jiBIeJRWrYy4+SMqlu4kDIBTwK7MRDZXqOkyfOglF/Q+3tEkGeUBEMTwpXCYKKSVkFXMHBSEUWwqWPdrCE4laDff3bZFT2iPYkTQ==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(376002)(346002)(39860400002)(136003)(396003)(46966005)(336012)(31696002)(31686004)(26005)(36756003)(44832011)(2616005)(6666004)(316002)(478600001)(186003)(70586007)(8936002)(83380400001)(81166007)(8676002)(5660300002)(47076004)(82740400003)(2906002)(4326008)(82310400002)(9786002)(426003)(70206006)(356005)(25903002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 15:56:59.9410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5a8b71-3422-4ab2-d932-08d84aa1d52a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 27. 08. 20 16:48, ext-jaakko.laine@vaisala.com wrote:
> From: Jaakko Laine <ext-jaakko.laine@vaisala.com>
> 
> xiic_i2c struct alignment causes the struct to
> take more space in memory than strictly required.
> Move state -member to end of struct to get less
> padding.
> 
> Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
> Suggested-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 10380531d45c..1453d82bb664 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -54,11 +54,11 @@ enum xiic_endian {
>   * @lock: Mutual exclusion
>   * @tx_pos: Current pos in TX message
>   * @nmsgs: Number of messages in tx_msg
> - * @state: See STATE_
>   * @rx_msg: Current RX message
>   * @rx_pos: Position within current RX message
>   * @endianness: big/little-endian byte order
>   * @clk: Pointer to AXI4-lite input clock
> + * @state: See STATE_
>   */
>  struct xiic_i2c {
>  	struct device *dev;
> @@ -69,11 +69,11 @@ struct xiic_i2c {
>  	struct mutex lock;
>  	unsigned int tx_pos;
>  	unsigned int nmsgs;
> -	enum xilinx_i2c_state state;
>  	struct i2c_msg *rx_msg;
>  	int rx_pos;
>  	enum xiic_endian endianness;
>  	struct clk *clk;
> +	enum xilinx_i2c_state state;
>  };
>  
>  
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

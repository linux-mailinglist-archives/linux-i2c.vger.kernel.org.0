Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5374B5B9BE3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 15:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIONhG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Sep 2022 09:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiIONhF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Sep 2022 09:37:05 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150102.outbound.protection.outlook.com [40.107.15.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8936B2E9CD;
        Thu, 15 Sep 2022 06:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M01Tar7N/nuCIdFbUl8yvc1U32SVyMukBumPwOTAJmdxtndHMhMu9d9Piw63G6lT/6onS7nyOGAJq6SZyq087Ici9xzxWTZ5ascOAau9TLqoCjrm4vGQnH/M0kvFDdK5PXU5mTswkcO7FGfwN3ABAf3YIm8OyDipKvvsDlxVK2LD7U/mEK7Fkl5TCLMK8MefYhSAYNeF4uSh5xdksHro4N7bifcTABhrhBpcCaj5bqxwPdonAgKdZeCybUttCVXFJBaEZbUIVpqG/YE4YEHD21sYW3/bOVb1uj9v8U3MvVZoMPVq1t5+UGTqolEb5iqh+5UcXWNq9du5pKjHZuxhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZJ+ETMLmzhYuyXrTYt7lwpFNnu2Co4fFRHa4aWGR1I=;
 b=ax//fsYVAh37UZ6aj6i/fOWYrV3LW+9aqAcDpl4KyG+w5zSJCHAql4UJAynVAUsjL6fCosThS4nqap3+tyxvCg49BxrTrUwOF+eYs/sAaLeIpRFPDL4pr6oI66zc/Sz7zMrPpMaZjPGjid+gilpbgrx/jV0AAv5lwqVFKlWinfaF0I5vx6UTrFXlo3epb8LKY4p1I0sjBg3tTIyMHQSNGZQ66vAuKbMoF01CCc2uP+dLRDXK1nVfaYo7ZMubeKLo3rCgAd0Nptv9q/2wqKfdkS95VTGTIwlj/rUcdZFcgwYjpYdggjnE/h9h5RAEpyovU4S26Nd0x4iQqzEivOhBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZJ+ETMLmzhYuyXrTYt7lwpFNnu2Co4fFRHa4aWGR1I=;
 b=idfcaSDqbBQ4pKWHKoFhgm9rITE8TJKO9qf/kG8R19UpckHpPd49Rtd3+7pxxTIE2m8ZKNCpUuWFR+lCJF6/dp0EQlrQBfcdERAcD8exLEqPQ1LQlO9PgQ85mKxTkiT3zmJGEEFngjOtXQGDJ0mbe8uTR2S3WewQfZ9An9obTvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PR3PR02MB6412.eurprd02.prod.outlook.com (2603:10a6:102:79::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Thu, 15 Sep
 2022 13:36:59 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::8d5:eaeb:13b:8a35]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::8d5:eaeb:13b:8a35%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 13:36:59 +0000
Message-ID: <04c933c3-499a-e13b-c25d-a60e601dbd8b@axentia.se>
Date:   Thu, 15 Sep 2022 15:36:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YyMM8iVSHJ4ammsg@kili>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <YyMM8iVSHJ4ammsg@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF000013E6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::1c) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PR3PR02MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d77f6f6-d9d6-4475-2d09-08da971f5d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ta/F4qglzpYWr8Mj85nRz9QWqldUiwKIdE6mQkQDWi6xUvLEEDu84VMaj54yYir8UzT9ESAJnFZTuPd4nFRwxX7SO9YgRGX01VoZ4a5RTeb6EL59K+Kpj2S1Gzk/LnxiSMXfW2DqmZFj4MZgIIb1tLJM3TU3PFyPEhYXEUHQ/dmgR4RcjLQ5UcwfSTD/2kSFsZrgI7gzotaVUId3zsdvOcNFqL4zLztyv87BdtLaz1dzMjOIRkMbswmULf1A2pt3+BIRJpRRylKcJDqVXg5OdqSPG01Ub3eWx9mcXfztTaHHOJOD4VdC6ABBT2YfvsQN4YrLfAb+m4A01jI1GOYjGGGBcdHGwr9sBW8sKp0BKbifn6/ur5gvsuf0ow2mhnas4AhWPeefxaigZCrHGEQtWTefJwq7/h2nlO9NY1IBqlMvImDHUW5N1RjZdVN7ZtYs+faWsLN5WVVZfvYBZqSQhh8c3HJtPlVt75KKJscsF7tLkZSJwV0R9brDwrsVHbLxd6rbmLfjPu9H+GX/dET+2jIDBXM2miCic7C62sy74C+2OEA1fkzle9Tg/xGmqDWq8yiL6Ifw+ncEK/T1qgNoUd7wt6MT5V7Q1ZK70n5x2Dztb1e7VsbCY4KvNrjEJRDCz40+8xc5Cx9MMX3il/af0k6QMhc3YZyYo3S2wHihLkjlZtedwKP1W9PXQNffUzsilgKkmd8EbEFcqkaB4z8kMyUkFUGqGkyJmdXZbUhAvM9k1xsXj2MQq1l0VsV0xAzLIInNnVvB7JdoFuLu3m1iitepBJJRcuGDD8YGIVnB0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(39840400004)(396003)(136003)(451199015)(6486002)(478600001)(31686004)(83380400001)(6512007)(6506007)(26005)(54906003)(41300700001)(6916009)(316002)(66476007)(8676002)(4326008)(5660300002)(66946007)(38100700002)(2616005)(2906002)(186003)(36756003)(66556008)(31696002)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzZLMHB4MGRSTGh1dGtURzFGQmhocUpHck9CSTR4MzB3YzR3VXZtakxMNXl1?=
 =?utf-8?B?am9tSE83YW9wWEhLZHQyR0RxbC82b1FQZVJBenk0b2pCWGhIckFsMHdGRkhB?=
 =?utf-8?B?VVlxSEQ2MlJjUE9haWpSZW9LaE5ZdzlJcGNvWThHc1JIdEt2dWlpOUl0Z2Jq?=
 =?utf-8?B?Y3N5ekhkV2FGQVkvRmdROGlpaEc3NU8waThxOEFadjQ5UnVVYUxIMXlnOGls?=
 =?utf-8?B?OEZCVFBLR3hNcVNseDJlRXpNaDAwUGtLRW1aZU8xT3FLTjJROVVHWDVKbjBK?=
 =?utf-8?B?TzNLWVk4NStuL3Y1SVFVd1dVMy8rUytGQjgyMURLR2VjdTVaa1o4TkhDbDl4?=
 =?utf-8?B?eHJyd3BEWkZ2OUVmdjNWRExYK0dBZ2luM0RpOSt0bUxrSkNVcmFwUzFlQkgz?=
 =?utf-8?B?OWM0ejdsL1g4eEx0S2Uwbkt3NlZ6MzhyK1FyeUhrV05SWm9XZXJLZE5kYTJQ?=
 =?utf-8?B?RlA1cVAxcTBtNUJFcjlmTWJDUWlndHk4TkcrZi9GRVZPMWM2N0h0MVBFV0c5?=
 =?utf-8?B?WjM4aHVKbDZGK3llUTJFa2JMbkJDVHlkOG9mOXJGYjh3UG5wTmJ1a252UjIx?=
 =?utf-8?B?VXdpUGcyOXJCQThocjZseDVRKytIUHVPVjZXV3dNUW1CNkRLMU1TMHQvTXVo?=
 =?utf-8?B?NGNrRXpVdjNKMnFhdUVwUGR6dWNVYngzc1dwM2ZuaUxQQUZmekpCVDlWQjhU?=
 =?utf-8?B?WjBFc3VEZzM2OEF5YkxodXV0RjdjV2ZlYSt4TmtCUWNKbnhkSjVhblZzSmtU?=
 =?utf-8?B?dW9CQ1BwZlhzdTJXTjBJN0J3alpqNjE4SGZ0bEtzMGo3RUhIL1R0UWVjSmJ0?=
 =?utf-8?B?R3Y2UDg4aElDTEYwdFJyR0IrME5NQWovOEhVQm4yNVNIc3UzR05xalVzTnhW?=
 =?utf-8?B?Um9BUTUrQUk2bGsxMlpkdFhGcmRVR0NtRlRCb0NqS0dnZHZ1bFcrUXZrZTQy?=
 =?utf-8?B?SXZZYit0RmMzUFBtY08rRFV1ZGxlYW9yZlJ6d0dGQmNZK0orRFVOV0JUVlhI?=
 =?utf-8?B?YjM2YkFJcm1YamZWN3Jub3FJdWdEcFdBNEU2L1NpT1ZYRmlST2Y0d2ZscDVC?=
 =?utf-8?B?R0JHT3Bad1NTUE1zdkRraGlBVG8vVGQ3WHRYdmZ3eGFuQjRZMDhjdVEzY2dU?=
 =?utf-8?B?aUF3cVB5VjBtVkkzeXYxamlnY1FWb1JneCtBRElGRlY1QUJQSTU3Tjl5VnN2?=
 =?utf-8?B?L3E2QmQweFJhK0FsUmhPZTR6QzMvVHVSNkpYR25MRkhLeUZBNVU5ZEtrU1hk?=
 =?utf-8?B?R2o3ZGdEMzhSR0VIRmFLRTd1SWkxTzdaL3FUT0RSTThQMVZDRUdpMFlWZW5T?=
 =?utf-8?B?TVp3eFFuOTZtVHZXMkllQVJPKzVRd29zV2lKSW9jb3RnSGJFVDlEWUtyRlRa?=
 =?utf-8?B?dThBTmd2RjBkRmhrV3lvazZlWXJhOXdHdHJNSHRScGQyWFViYnBhMkpGcnlD?=
 =?utf-8?B?L0lEZ3NxNzNEWlZhOXd6RHo2VzZvaFJqU0szSk5hSGEvTUREUjdLZnoxS0xJ?=
 =?utf-8?B?QytMOTNlVmpVMmU1VjlDY2w4dk53SnJKVithU09iY1liYjdsYjduQ0lOdWNU?=
 =?utf-8?B?S0lkZzBTR1lYbGhubkJUNVJhTkEwelhHVStjei9hdDErbXVBZ2JzVm1FWVRW?=
 =?utf-8?B?RmFMU3NyOUk4QjkxVXIrWWNqYU1uQVdtMXh0WUZvbXJ6THJ5alFRbGoxL2w1?=
 =?utf-8?B?L2d5K0p6SHFMbSsrV3JFL3VrN3E0QmdsRGJ5S2p1MktGQStyekhsbmVaUmVx?=
 =?utf-8?B?TWNrdmJYS1FuVWxBcDM2UzVMazU5b1FBWU1ERTRRK3dmZDFObW5WRm1QNTNu?=
 =?utf-8?B?QUpReEtwckYrZVl3djdBajVDWEVvd2p3WFVyUnhGZUdFNkV4L25oeURJV3Fk?=
 =?utf-8?B?QnN5NG9hTTRzK0hxdVRjdGViVThDSVA0WkY2Z0o3QWs0UTM0VjNOV1krVHdN?=
 =?utf-8?B?V20rQktzNTN1bDFQakJaWDVQMkVpa3lOWjFaZnRrV3ZwZ2tZYWc5ZjVLTnk5?=
 =?utf-8?B?SjZackxxb3cza2hWTkRjbksxVDJKeWppZzZJY3RKQjFMUE1ta1hwVUNJQ3lL?=
 =?utf-8?B?TFYrQk5sZ3RpT0ZZK05Benp1ZVJVdXJEbG9zdm9hQ292ZVM3RHUwZ0RvSmo4?=
 =?utf-8?Q?GjU4yZVhVI8vvp4pjqYtdYRC/?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d77f6f6-d9d6-4475-2d09-08da971f5d99
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 13:36:59.8008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fj80hrfUMIMvPkmyzjZGfaB4vKI9JS/XyV5Tjnjs67qMG5cR4h2wfAvYRtrpHoZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6412
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dan,

2022-09-15 at 13:30, Dan Carpenter wrote:
> A couple years back we went through the kernel an automatically
> converted size calculations to use struct_size() instead.  The
> struct_size() calculation is protected against integer overflows.
> 
> However it does not make sense to use the result from struct_size()
> for additional math operations as that would negate any safeness.

Indeed. Nice catch!

> Fixes: 1f3b69b6b939 ("i2c: mux: Use struct_size() in devm_kzalloc()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> ---
>  drivers/i2c/i2c-mux.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 774507b54b57..313904be5f3b 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -243,9 +243,10 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>  				   int (*deselect)(struct i2c_mux_core *, u32))
>  {
>  	struct i2c_mux_core *muxc;
> +	size_t mux_size;
>  
> -	muxc = devm_kzalloc(dev, struct_size(muxc, adapter, max_adapters)
> -			    + sizeof_priv, GFP_KERNEL);
> +	mux_size = struct_size(muxc, adapter, max_adapters);
> +	muxc = devm_kzalloc(dev, size_add(mux_size, sizeof_priv), GFP_KERNEL);
>  	if (!muxc)
>  		return NULL;
>  	if (sizeof_priv)

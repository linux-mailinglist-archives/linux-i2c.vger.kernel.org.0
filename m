Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0F1D6A4C3D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 21:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjB0U2u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 15:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjB0U2t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 15:28:49 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A4FB77A;
        Mon, 27 Feb 2023 12:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677529728; x=1709065728;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qCYmV93ovlSIbv13cvH3FUQWKyDK7YaMSdQwbV+zzXo=;
  b=l1qUtwg7F0Lw5PYBNn6RZlbp48L6SSSswOIvh0woRDKibV4YPkR4FW9G
   iQlkroRhbBl2deoidgUqdHirtIL6dSy27ZAUWNBpLdbBPy9Xl3E2B+/MP
   EeK0jJcP4ZDRA59DMckK3yR8AA4gkYIYq2nLi8Br3MLpTOjL0cL7RVlC0
   /3/ha2n2LVaCX7TYTVbRypcaak09xUVIf8K8RFqOSm/ifukOI1CrndWPh
   2LmYu0IdHpDc4L4kgfgsCH36GW/yBjUDbuI7UXIWdz8E4wzOU8y6Zm2Z7
   SzGajRyl0y9XJ3cbZxUwoIcXQVGtjEP0YG4096pd0Tz506W8HrbMrR4X8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317760104"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="317760104"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 12:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="623754709"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="623754709"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 27 Feb 2023 12:28:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 12:28:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 12:28:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 12:28:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep4IHlbgzgkx/2NTkEwzNsON5+GUzpD4iY+uT33mDzNDrO0vEVZIYcMwtywCh5W5j/SI0i4rOiQYJk0I+8jA7EwoiioV6qaaLg7IRz78pCZ+F243nEtPJvhKOhTFRTePS0PoKzerUnR7EcXb7kT2eyCwpy1lGkPjig9PzrNfwdHx2Rzb7BmcexdFQNEKWfwUvdSgXmBiglJaRLPVFvfEASDqjfneWPWa48hCM+QP38RVqQEEz+7xPWdHsXzdhvOwsonY5HwcziSj8ygFEZCbwdlTRGmPsUlooJ/EDMRPvvFtNDh4xuci59PebeP1HSe7VtScxQFuKyWprp9pvBV3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PmmzQWLcmaXxGn5C4Z2/fYuRjcXPmJK4WxsKZ/THcQ=;
 b=SXHyVoP1PJhTeIolQKYQElxPDBIyum8v8+SxbrLdVz6nhvi2NhJ67SSIypkJamnq4T5oJ11gDMb8qxpSbnYsfCw2zLa3lK0lQfg2PNwfUx8zHpC6wU7MjOzNoSGbHVsmXCdZfhPRrY/7pUnYbhFFX3jh8fA6aSPKpkK/kqDw85zbb5cHdBSxZRp2Qrb6NVnKUc0KiNgdiOfIbJ5Hr4xkUbcuAQOAG9q3QxkC+agLxF6EONSrU/GwQpKti7Le6gpJuJOAJuiIsKm9qvleCOZCytLIN86nFmc/x7TdaPbMGEXWguLkT90Yd5DoHBKiMTL5jCN377mqumQFHo6GIf4g4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 20:28:46 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::8905:ba85:9f03:8e2b]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::8905:ba85:9f03:8e2b%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 20:28:45 +0000
Message-ID: <e8782296-49bc-33a2-47b3-45c204551806@intel.com>
Date:   Mon, 27 Feb 2023 12:28:43 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH -next] mux: convert mux_chip->mux to flexible array
Content-Language: en-US
To:     Jacob Keller <jacob.e.keller@intel.com>,
        Peter Rosin <peda@axentia.se>, <keescook@chromium.org>,
        <gustavoars@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20230223014221.1710307-1-jacob.e.keller@intel.com>
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <20230223014221.1710307-1-jacob.e.keller@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:EE_|SJ0PR11MB4911:EE_
X-MS-Office365-Filtering-Correlation-Id: 301334c3-01b3-4b55-582f-08db19013999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZsAj+OKiyHHgqOlb4mnS6OpuJtkrUu8rbm70ZG3gmI8OeHhNyfuwE0kF3JS1A3fMlOz/aHR39RrASOtlgjyW+mw4SIWXx7Ysel+vygXvi21yGSw65hGYqN2RtPMH/Az/KUGyYgHvRxj0l4+FS6DsE66ow5UQSgF8XV7u1Ej8RkLNRONrIqf2QoAOk4yv7OdJ2TMefnlpPyn+rroNRqzwGHbGVFbtOnHEtYDnlzKH0xuOXfhEwhJgN9mqMZX6G6pKlanISxhygVY0uULNc5YHNEUh5ydi3Zx0une0MxwB/rxqPkG+CB/Oj97zZdHNfgPtDEeScXzBdl/otZ6c1eUTTw++pqM8YzOV05rdUy2EQpPHaxiipWTynwqecwhRJ72xxzAC4QNY0uLhEi2Q1GUpHJuMT05WUBAOjUFA9pn3ct2hK9ihdAM4hjzQ2ciwc36H0lbks+657uJODgLx+97jK6xmPkxixSOWMB/5tvfT61/cMCDiHBiupUlp6bvHOKoFF22M5E7J7qRyibsmmDBrthLV/u+JIym9M/nC+EojgjmqQz84x/jelQggZNdDcFOdSpUohR2HHwOMK8HYjwCJwmzbVJd9RcsRanDrwE1W/5Tjf0YPMm+KIBddMuMvsZaAuSAYM3gBk2/EjH0dF5pH4AUfH4T/X3MMwsgyKuDy+LEe0RX1D3ul8E0DDIqWshurs7yQLi5U6zms79CqmjHR6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(6486002)(186003)(82960400001)(38100700002)(83380400001)(66556008)(66476007)(66946007)(41300700001)(4326008)(2906002)(8676002)(6506007)(5660300002)(6512007)(44832011)(478600001)(53546011)(8936002)(26005)(2616005)(316002)(110136005)(36756003)(86362001)(31696002)(31686004)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVoybjFVd255d2VZemZKVFc0ck5CdklaV2J4aHg2V2cwOENtMnY2WUliK0Jz?=
 =?utf-8?B?WDNadmM5alQwZVFBU0tWTU9wWmJLb1hMQzgwVkpuU2xXNDNYSHE4M3FRQnQw?=
 =?utf-8?B?eE1EUkxPRWZGbURCUHZKUTlJNUc5V2hXaEhXYytGbzdBeElicXF2bXJSNkl0?=
 =?utf-8?B?Z1ZSK1FUQzUzZ0FyUUV2Q3hFZG02dCtoM3ZBblZreUZZK0Z2ajBmdkUyWDg1?=
 =?utf-8?B?bGFXVzNLRTFqNEY0Zkh6NnNVUjU3TGlGbDNBY1hQV0hxMSs0OXg2eUZVbDRa?=
 =?utf-8?B?bzdneDFLaTZJUXFoRVpUUHR4ZU5lMGtOcy9wU1RGSkhsZTNqQ3dmNjhYWHl4?=
 =?utf-8?B?eHpJbXhxSjVWYTVlK3o4aG1hL29LUU5FOTBNWUl5ZzB6VVYrVWZJNCszRnJh?=
 =?utf-8?B?bzVxM1ltRW05cysva01oVm8rTXNicHlFSTN1MHNEWlV5RGdHRlErc01rOFBw?=
 =?utf-8?B?aVQ4L2lNajZZQWk2aWNhNWVLcVBldGpuTTBJUzQ0Q1R2cWNvYmQrdHFLSSsz?=
 =?utf-8?B?R3R4aTJLSjQzK0w0a2xoeVVtcmlkZGhrUHZzL2ExNFROSTNZTHF3Q3lVR3Vx?=
 =?utf-8?B?cU1qNHNTSmtQekVRUDB5Skt4VXNrOGtOaUV0VUZYdXg0QTZZVENSV3IvMmpG?=
 =?utf-8?B?TmovSkFuVVpiSGZjTThPMFhDY09jYTJhK0Uya1NYRlBnRitGSEZIZ2h4dGJo?=
 =?utf-8?B?RW9BZzlVRUs4WCtKZUhxdUNma1FndnM1VU10cGZMelFqUW9nVHk4WWViQVpl?=
 =?utf-8?B?SUo5RVh2bzdFcHBORXJPZ2cxR3dDajlxWUxqNUprdVVRL1FSWmZJVUNiM0V5?=
 =?utf-8?B?ZDdDSHZ5MUNKQ2Ivazc2c05ZWTRUeW5hN0RIQVpQWGJyZDlrTFNwQ3BiVGRZ?=
 =?utf-8?B?WW5PcExSU0pWd0hSdDFhZHpyd1gyb25rZG91N2lJTmtpa1VURVVvUTMrWGw4?=
 =?utf-8?B?cUcrcHZxdTRoc2l6M2cvajRmWUJLZStCa3h1Mm16aWtqM2Ezb1BEanNvcUtO?=
 =?utf-8?B?OXJFL1VtcWFBdUhTVnJlYkdRUVpOeVhpMVdubVhsQUlqY05aQVVxNlRvL0RM?=
 =?utf-8?B?Z0g2TkRQWS9iTWtnbnlrek1HcTBhN0xDWHNWZWw3cTBidU9LM1RlUldqRFF2?=
 =?utf-8?B?VHBkUUFxV3lKVVkwcUN2N2xxUFVuRGRSWExQTlBZMlAzM2p4TzM5b2lod2Vh?=
 =?utf-8?B?cWU4dTR3UlZDd2FqUUVjb28wWUpxOFFibmhkcDROMXpmcEpXalArbmhod3Iy?=
 =?utf-8?B?VU1LdHJXa1VZbnFiTXNzc092TTc3TWZ3aEpnbDNMM0lTV29VOHpIeFlKVW56?=
 =?utf-8?B?MWdkYU1DT1R5ZDZXeXNENDlmcGxuM3k2bVVXYzR4YURKR0d5b0E3U1cwNFNm?=
 =?utf-8?B?VDBBWjBSQmgrNU1LY0N4WFdITG5FRFcyVWVRV2J4d0tCUHhXaCtiWmpIZlBZ?=
 =?utf-8?B?eUdaRjNWNFBmR29aZXUwVFFFa2U2WlhrM2hKSnhDenRLZC9DMjlaL2J2bzlZ?=
 =?utf-8?B?NkFTN0tGVjhTVVpqK2RJNHExd3prSjZ6WEQ1ekFvNXJFaXBoMG9EbGtJbjh0?=
 =?utf-8?B?ZEtDMGZGRUVtY3lIeWdJWHJtQUxQYlFsSGcxRHhGQ01JeGtUQmZrdmV5bVN3?=
 =?utf-8?B?T015Y1EwWG5xd1p2eEJWM29WOGI4VURIRGFkd2hGZ0JjaUdsb1hHb2s2SVI1?=
 =?utf-8?B?M3lNVG1KUldUbTRKZm1rZndocmhrYk9nc1hWTnVkVWZxaDJiWmdUYzhGaUhm?=
 =?utf-8?B?NHFGWXlEU0xMaHNRaWZuUWp4TEs1cnhrY1Z0bkNmVTZ6cGVBZHlWOXdWS09H?=
 =?utf-8?B?T1l0T1B1QnlhRVozM3FqMkVKaCszWDF5ZE9leDUvcDQwcndrdzVZUDNQWWZa?=
 =?utf-8?B?M2UxcFQ0Ump1STBkeHJwUlVUVUwvMUgrRzlrSkxaT2JKcEc2SjdsVTk5WFBj?=
 =?utf-8?B?dlk5TGF1Y0EzbCs0dlUzajRHREtQMG5LQk5BSXUvN05iTWtueWFTYVJ3cUND?=
 =?utf-8?B?aUFwbGFjZDBnRGlXOVZkd0NTb0RNVVhWU1ppdE1LOE5VNm1RVStSV3ZySTlY?=
 =?utf-8?B?SGw1dUkvSmt1eWUzNVhQUmZibWN3dXlQZ1c3RmtWUFRiaENrcElvR2VhZFVG?=
 =?utf-8?B?VmtHMlZYZGg2eE1HU0VkTVVJdmRIZCt5OXNBUFhzaHJ0ZmdqcjA1QkM2NWtJ?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 301334c3-01b3-4b55-582f-08db19013999
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 20:28:45.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn8iYUZzkjOOkzeR+0THigeTyrbzjY9jmrv9FNi8LGTl1y/Rl8RGNsmZN1OjxuuR+VeLhq15vW5qAxhfz3+DMWNg2iLiqMYIabq+25irayk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/22/2023 5:42 PM, Jacob Keller wrote:
> The mux_chip structure size is over allocated to additionally include both
> the array of mux controllers as well as a device specific private area.
> The controllers array is then pointed to by assigning mux_chip->mux to the
> first block of extra memory, while the private area is extracted via
> mux_chip_priv() and points to the area just after the controllers.
> 
> The size of the mux_chip allocation uses direct multiplication and addition
> rather than the <linux/overflow.h> helpers. In addition, the mux_chip->mux
> struct member wastes space by having to store the pointer as part of the
> structures.
> 
> Convert struct mux_chip to use a flexible array member for the mux
> controller array. Use struct_size() and size_add() to compute the size of
> the structure while protecting against overflow.
> 
> After converting the mux pointer, notice that two 4-byte holes remain in
> the structure layout due to the alignment requirements for the dev
> sub-structure and the ops pointer.
> 
> These can be easily fixed through re-ordering the id field to the 4-byte
> hole just after the controllers member.

Looks good to me (just a driver dev, not a mux dev!). Also added
linux-i2c mailing list and a couple others for more review.

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>

related thread (cocci script) at [1]

[1]
https://lore.kernel.org/all/20230227202428.3657443-1-jacob.e.keller@intel.com/




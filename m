Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749D1604D6C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 18:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiJSQaF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 12:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiJSQaE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 12:30:04 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7203013C3F9;
        Wed, 19 Oct 2022 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666197002; x=1697733002;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=R7gM37LQj7viFWF92xKmh2d/fhjQnGVrQokgrEjRho0=;
  b=TV43kIGAObxKfTXomcaZHEBrx3YjBxwLc3nBrt0Uai6zQktVHiomK8k+
   YyhXufZd1pTZuNQdJhUAFV51Ovqyz4Bj6OUA840+QGIoxeJOE1qjc2N4Y
   8J9jJDPGRj0lv4OBHTAVwNOtxTmMLPwmVf/NpkAjHVUEqLpBDr1V8W4jb
   GnSqNDfEXP4Pmy8ozrzVHIIXvRTQX3HGulVLS/qMiOq5/Hqo3+XO206RP
   zSMGyY4fnxL7gQRab1HE8j9nt5JUZKkLX/dGs6b32fbJuyz8rChd/Gs3k
   R/3/vH+9VJvvJFF9CvS1WQ0TNhXEUORnfMv6HBWs22kVYgMHt6bk0SDWy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="289780697"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="289780697"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 09:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771868778"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="771868778"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 09:30:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 09:30:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 09:29:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 09:29:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 09:29:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJnlAv2ss+j/Cv2hWzBh7Ed7pGFjujtgsLsPRUM24/1WZ6sYH0O9RE4rr/3HnXHlhBS+HHgg+7MvAnknHCHivqhJn0G/G4XlcpKNiklfYEOQz0721l/H7PnSvNPK+xkFLgZMVjESxwZvofzREnlhTRl4r59lT0bWFL9ReMghCL/wRopK/rPnL1nR3giYLhJChLoBuvPAG+3OUsaaM2yFyUCvQUeWDHCIZYxbiY3eySJpL727GKHGkq8LAJebBsqTAtnScI+NGpy0Z9xLnZjf6fLfnILgHrUx2p8bgFmGpPIBfj+8j9+6nhfAWl6jxk9RuQfMJGlGs/LAATdaQ26LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms4r4mkfunOeQJSJ4CJZF4x5oWo9ciSjDtliWdQTB3g=;
 b=TY1A18MgvjaHQCeqoBpxN9+M6I3cFrRl9vGcie0xWZtl50CHiC9bs/QOv5uiBnNPTG9mvYi7h3ijV0/aCtGwKXytQLRrX0Kz2RNHC2aRPY9O77lVFtoA8XcZvSq4ocOGTXObxGBgsibMH1K85OTcX1PQYf+ZBQKWoZiYVDfFPJhqbA2WlBskqJgM7AdrJYoBOlPosCXbtPVGl0PQz/AI9U4Ul9VM594iATWuQ+wezWhFv54T5f+9kOVchhhGJvAhzq2SzkrzTZ2dD6rq2a247YdrvsrlG+DqXz+kGZ9qyTdMoSSpZ+xCP9umeKuVfjrNGVZ1qVy4v6dMxLl+yOYOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by CO1PR11MB4945.namprd11.prod.outlook.com
 (2603:10b6:303:9c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 16:29:57 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83%12]) with mapi id 15.20.5723.034; Wed, 19 Oct
 2022 16:29:57 +0000
Date:   Wed, 19 Oct 2022 09:29:55 -0700
From:   Dan Williams <dan.j.williams@intel.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Dan Williams" <dan.j.williams@intel.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Martin Michlmayr <tbm@cyrius.com>, <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 09/17] ARM: iop32x: remove the platform
Message-ID: <6350260347e61_17cf294b5@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-9-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-9-arnd@kernel.org>
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2126:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfed127-b991-411c-ef53-08dab1ef293a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lk/8idtq6jIyo5hI3laPuNWytqFAfe8wO8PG5v5/4GJJ74ccmYvj0TwpwowKxMbFXGLcNiTXTpPYY4WPAZ6XOs4tTt6Eovv5rjAGBNAwSEn/HWyP+kqZIdxr8ZWNayNaFHTePtHfHAgKggglXOjSEUWpR2izMnXZB3oXRhnVEVhSxq4h/aNxzMEGmxlMC/9aM6adX9vEn1XAzbusKq8sWiwkuPuuJdWOn3gfo0oB81taEz95qr/SOqTM8tF9N7Ss4Uf3s4oqF6duPbCT2rXufJuzDuPH8IRuvh5oZL1ullSzqePrAk9XSxOphTtWD0dVHd879Rb1gvZ3Sm1mvesONNZ6vNyzG8T5/BIEEFlwnPiMgIWeSWNgKEm5z4qX/cFjxdFZQ4skKkFaobpa8f/sVC8Wtb01eHyLJq7khSNnOE8KXgq2qm8ZEkj9dnr/pQ6/tdyzPzCkJkhTVYcISBkQpLokSA2179ryK/y/DrtdHKcNQcRTr0Pv0TOx/2yJDjK+iHLMar3iaIWbbtlCzwuWM6bPTY5LF46frGQCTow3OFq9iG1j29BN8eQEQZjdPj3vGDMFoQxuNhY+MCgRRt3hPHyFG8nHT+q3XGz6k3HgHbB8WE8Bmlw2Lnubj/pozEl9/YO2OCw7k0nM7eVioshWO+z5Q3My8UKEYSyiwMg1dbWT2bsjis4pybVfcXmctvbcBP8/WgiWYXTPwx0mw81uCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(82960400001)(38100700002)(86362001)(9686003)(6512007)(5660300002)(8936002)(41300700001)(6506007)(558084003)(66476007)(66946007)(66556008)(26005)(4326008)(8676002)(2906002)(186003)(54906003)(316002)(6486002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?snsGvacJxCes33oYqSSzjOEMmJl1x4CsGGjYFx1oVdtRPdTu7fdL5ZivezMM?=
 =?us-ascii?Q?qD/OqL+rlUOOd9imeXAyu3MarbwirHWiFe8PSPekwZxTUxTJ7jrsww+1cbEC?=
 =?us-ascii?Q?azLZ6N6sns1hzXcJ78MdHzP/1TdbwOYAktjmvr+yhj429ihHNMfEIlD6X1ml?=
 =?us-ascii?Q?fGuuKlK7KsTxncFK9eibed5FzpbNleoFWBXX1DvycoYQMlWPSfs4we+ItHB1?=
 =?us-ascii?Q?ymlX0FynLjkwKb/DaDEt5bvYGSwdsl1teb+SEjMVCOt01NV/eKChdyaT7kJb?=
 =?us-ascii?Q?9p+IVrYBJo7Xorw2AeOX0FCT+H2mjkAZt3j3JBXgiNvpgw6+Sj064ZWo1Ue7?=
 =?us-ascii?Q?rGICjiy8HsP4XX3fRwWdFZRKKfk2Bft69B5P1UTUG8n2IqI+OGDzs/CTyMqG?=
 =?us-ascii?Q?RNpo/vIa4LiDEPdf5Mdxa4QvZmY1T2JEmy63kvpYF2q0UNfeH7l1D1yuE9M8?=
 =?us-ascii?Q?8I8Q9SRc0K07y6BTJGG9A+MfYgo4Ms4vnXvgFJL9esU8a0ImGMXnk4Y9h7IV?=
 =?us-ascii?Q?yOjmyca/PCYeT4I1pQMdtGwFdxHTTATdXxdPQLbVdfNSyNl44soCBf0EmH6q?=
 =?us-ascii?Q?lTJkvP8Zf3XYkJnncsRO8Hq3KcghnuMgyfXD+JGuY5SbQpVKwNzA3zcvCbZ1?=
 =?us-ascii?Q?2tbniGCcbYq7eZP4Wa1p+1z/4MDg3TXk2Yxb9VJ5XiXbdTeXnu5Xw5CIaBM+?=
 =?us-ascii?Q?nbTzPWBQ01g/VXagkktUqs0WK7uZ310Qdp9szfaAj6z0zZ7HDPnT09JmMlAg?=
 =?us-ascii?Q?u4mwXXPX7wJEJiL85QS4awNv+d6+UGvYTIDAGJoLE1IAyaAOTqZRs5i62wyI?=
 =?us-ascii?Q?BfjDnmByCEE6OFSysnPZDkQa+KYSyoiyFhpqNI8xJv8vJuyRBONN/1SYECJN?=
 =?us-ascii?Q?xRmbSEefq1l8txjFiGFnyD8Nbv2/uUkRt9F2hpIJtii9yj1e5hyacUUkGcFU?=
 =?us-ascii?Q?COd4lp6ziPlHINfcSmLntYhOILHfM/pP0pUz2sFUjw9iMl7igcwokel1z/Pa?=
 =?us-ascii?Q?QJA3xp45BgyYsNcZalmGMnC4eSZGYkk9iViMT8heo21HrB4y2sFFvGD+/acJ?=
 =?us-ascii?Q?K42h9qdmZsFRhBabawYWuuA/GStjNRiG6e1uqmzlTBM9o1VfN2BbkrygcRif?=
 =?us-ascii?Q?/4vPdFuIWtkt7eq62BIXTgaVM5m4jx8iSDulR8Mer5w2McEafOB+qxTQFgYA?=
 =?us-ascii?Q?3dkN7T7E3NjmGaMIVFIztkr+4HomwY769rf7777iAjEH1o6C1UgLZnjZPI8F?=
 =?us-ascii?Q?5DbVrUa8dRkGhFE7HS8sgox2aK4vEP8TBVjsAx+ZmK2K5BSKRw/9uO51FX++?=
 =?us-ascii?Q?ySJsOFixR67PM8NnkCQ7rLSHJnwxTPLGKXz4E/S4kDKvOnWsu0fpFyvW5l8Z?=
 =?us-ascii?Q?vKXw90tx5BhW3U53Oca+dWJ0Bi/db0fQ4iYrkLAOFp2GE3pRraHJmfhmv7tX?=
 =?us-ascii?Q?qTZ/fqgAsZCrTtrUxhU3LFHi2TlQLxd1vG7EOFxNXOvE5HwR3RI185Tev01v?=
 =?us-ascii?Q?3tGg6NNpV6oRKO6zZz9tnAJMsIWgDdjFKlRHgrnNRP4mqB1x3z55TxZyat9H?=
 =?us-ascii?Q?CDKU1P6hfoWWrznf6TwuRIezcOoJIIDIj4lmPR+xkbBgT+hvcffpTQrhSNbI?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfed127-b991-411c-ef53-08dab1ef293a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 16:29:57.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/uh3vZFb6VVMPsUQgpJ8QS/Kt5ZqGBzRo2cSBtxuhyGgNQCQMqcEeOir8UvWMcHNSe5Z5bP+3Xqv3/j/7Nc2PBcTwXpIKsXya/FbGYB/Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This was marked as unused in 5.19 and can now be removed
> 
> Cc: Dan Williams <dan.j.williams@intel.com>

Acked-by: Dan Williams <dan.j.williams@intel.com>

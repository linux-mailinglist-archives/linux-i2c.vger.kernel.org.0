Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D70441201
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 03:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhKACDl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 Oct 2021 22:03:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:30144 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230191AbhKACDk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 31 Oct 2021 22:03:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="317130650"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="317130650"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2021 19:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="726803425"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by fmsmga006.fm.intel.com with ESMTP; 31 Oct 2021 19:01:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 31 Oct 2021 19:01:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 31 Oct 2021 19:01:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 31 Oct 2021 19:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht1YAqA8IAOcBHSo6Jiz8W5S3b9aE1hWoU9Xn5rHUoC9SyWpwpskhck/Q635m4uigiGUqM55Guk1jsRkGVIDvkDQtu1bhrLMaixDjVDyhgQN3nW5vCRUVyCm5dQsBV3YtvfUaVVWZweF0WLAMbGd1DTtiAV23faIZsyGm+uY6Jq0YsJdBTavWKnNIWu2oWt3711X7y/VJmiNeX65mDPiiQuslUsx2m3ZBsHgXnr2bmI7FIUfXA15nOlglPOPMuX7YVhl4LCZn7qs2zK9Kta7N86kguieCo94ShUd3YxwBlT/5OA1Q1h6WcG+B4rxCBOf3uqRUv8BvF1CS8uFa/YCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7SwZ6XWI4JdqkbNT7DLsDISaK5CuDLSMZ0t6fa0LKo=;
 b=VHYgwOSRtw+EgpSkurPt3GNZCOSc84Zn1Mb0n8EdmFeHPp9z5v7r0eg0CiS38xkOov0QopQzJxB5CYmBwo6V5yMu5js1AbXIQkOwPIzC5syv36F7PbCFinRxRMDVexaAhCNZ4ZFE6STHJ6j5Br8xKBy8OPhiZ2NLWlNKqE8WDqwvovByrfxtY8G+4roljviZdRbkzjvjWtKDDS7avt3ry2SJ8P34cPIq0/BfGR6lzyu3E1rdBUglfU0dwwif1HJLlmzkUW9awdh0mEnfDB6fUYnbJywm5EB3O3/8PKXRMGYwUyS9HJTk+VucyoCIOPku4XN9O8eHivNEHF4IQtHAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7SwZ6XWI4JdqkbNT7DLsDISaK5CuDLSMZ0t6fa0LKo=;
 b=Lj/lZFoDlFXni8DnTrpe1BpYokIAWOhw5rX64mrAMZeOxLav5VtkPwA/j4UrdWViu2FocwxrtcKgKt9/JE6hYYIfj3OA7shQtT1v4lEznLE9dc2UXAxZqVgE6ph4yGQJ1Q1XO/rS/nXL8j/PUPEt5hIpecUXfCKwFUfNxpJBgQ8=
Received: from DM5PR11MB0028.namprd11.prod.outlook.com (2603:10b6:4:67::30) by
 DM8PR11MB5735.namprd11.prod.outlook.com (2603:10b6:8:10::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Mon, 1 Nov 2021 02:01:01 +0000
Received: from DM5PR11MB0028.namprd11.prod.outlook.com
 ([fe80::218b:b092:16d4:4b25]) by DM5PR11MB0028.namprd11.prod.outlook.com
 ([fe80::218b:b092:16d4:4b25%5]) with mapi id 15.20.4628.020; Mon, 1 Nov 2021
 02:01:01 +0000
From:   "Chen, Conghui" <conghui.chen@intel.com>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: hello
Thread-Topic: hello
Thread-Index: AdfOxEXWsXc3fnTFR06Z20XPo1yzWg==
Date:   Mon, 1 Nov 2021 02:01:01 +0000
Message-ID: <DM5PR11MB00283FC3A61841BF8E647363908A9@DM5PR11MB0028.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a46309eb-9414-4e78-13b0-08d99cdb74b5
x-ms-traffictypediagnostic: DM8PR11MB5735:
x-microsoft-antispam-prvs: <DM8PR11MB57359931090EA3EFFC7CE43B908A9@DM8PR11MB5735.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LjGZNps1Q0Xt6GAYKljndE+1YHuW3JFyGEiFht2h3uhRE1c52TIGVjv2hn8XeeaK2ZlBQ2CkXpjaN0lUBoxAJMFjLB3DLDvEUR12sjSPen9gb+b+EKAV1voKpwZN+a5YkrJ0VnTxqxSrhFnV/ypbHVxrl7ELIo8OWtAy5yL+NfBFK3oEg7m7WKNj0bcSPKrezm/wdWjOQSY1NPAHQC/JpPk2skIzUmNkjNgRiPWUteYRFB+JlbLFhqPUL5l6VMTQwGxGMEvGGw30FaXrXPrId/D0yN5QSemog1yUK4ReMVdKK9Rb/d9gUoiqluV0JAPOc8/SBdx5T3LbbhJGu0fghKwefrgdwuUS35xbGYxsmV9zOAGttfFGtMq4cfwpiEpGrfu+WFmeFN0KMRqbT2NSxW8fOCT1LX/OA4giEE5xfbPFumLky5B+Zn5w1NGxCgTPhCbD+nOFpx1vTzEuqFDBM48ccGNTAkEs2V5RrWBnYDX9RlUWaPa6GuFNiNKwHqe0532/+yqCrN1QBjVQ78sWKgh+KxZwBAC0Xg8j7LUiQaPfyhtjmYqCyHAEWupBRrrZ1GI2/o/gN9Q0/kYl/MUemRoIuoQNF3WsG4sjlI4A1mBSYcdzIqu0rM7aa54Pzofpp8aCqLPvpYdVhZSXmjCYu7dWR60Zo7T4Yhm5Y1gjviePhBZOXSS5OeUBWgtsMNkEqYrHt4ZMU9npAdqFM2jnfEKBJsrBP3QzY2vexzmR3AusvwtSGtNWLBMVSSxnV2lZGb36MqTDZaFaUiU1aCFTBLOVQODjPmCSheBGDnCbtYI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0028.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(7696005)(5660300002)(66476007)(66946007)(64756008)(9686003)(55016002)(52536014)(2906002)(186003)(508600001)(82960400001)(8936002)(558084003)(76116006)(66446008)(8676002)(3480700007)(26005)(7116003)(122000001)(38100700002)(86362001)(33656002)(38070700005)(316002)(6506007)(6916009)(71200400001)(14353004)(204593002)(220243001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9kz4XhGrhaQV+znadHLonYC197R+MeW4svMXEcgv4/r9VDTz0G4YUOjY0eY2?=
 =?us-ascii?Q?QAshLHpGrHXYHTNHmhEi1TcX1fjuYLTe7gugJFzxXkk4g7DYoxBfeDGniL1l?=
 =?us-ascii?Q?iWx/fsNOUqpW++zTI7UIgVd4hKZhAbxvHzPe69zIMIz22VvaeDUxvZdGx8Z9?=
 =?us-ascii?Q?C+oKL4LSTYQbLdoB2wtxZi5DsHUbV4PFXnsML52a9Gqw54OLIxLGk9de0H/v?=
 =?us-ascii?Q?I5LoDV0eywRMQXLZINeFps1Sja+4qm254WMeaRwveXYmSQd/B/CDO5Ss0zVf?=
 =?us-ascii?Q?2Cah13Tp8WjtlgTvcBrWN/7htsV6iS85wuwte0Kn0TTfE4NcMXA5vyViH+7p?=
 =?us-ascii?Q?2atAKm9KsThXt43TGG4ebes/1zMQMtTiup/3w4bYz8p7Y+ORhmMmtW/J8izb?=
 =?us-ascii?Q?Fd7A5aFhCyvDXQv2k6zhlZVpgKxzc/wwVgZi3Ehu3D1mQpBae6M9HO/7TRP7?=
 =?us-ascii?Q?e8Sn4hxTBQhoVgSaN8POBcWqrdOmR2cZlZodNB/D1EFWYnuphs87B+wzyOES?=
 =?us-ascii?Q?cKyNOzWIu5jk1bn7ANfB/LzzIXGrok+J32x9cZslZ+2QxCXdqsz1Es4Vrskb?=
 =?us-ascii?Q?ZX8ypNJnSaYw0nF6UGrKfhOp8HaenRDMfZomFOnfvWlmxaJSkbUv+SIQkT2n?=
 =?us-ascii?Q?lsNpMWmKTYtRyY7PHwLH0oft/PjCsG2E4+ciiV55xu65ZYI8dfaBSTYFFzED?=
 =?us-ascii?Q?ZNzgaqSCXRvLJ+snPlDdMTYDhRXsiiklZJpHyp+WGntcv0/qZJmc7LIwUXPj?=
 =?us-ascii?Q?G3QjTLwLL5nYr1moPcmdz97Fr8jFkxUrtb3FBFfXksG8dwht4X78P8a5SwSN?=
 =?us-ascii?Q?bbqwVdHOU5ZsG9gm597E0GmR2Tli7Br5GtpnuR8fIPtgNuX9Rxf4qVAa5y/U?=
 =?us-ascii?Q?KLEfDfXed/wNxNk+13JSoLH+RpDft3ZQpl4Nv8PrGWxphgAAhIgdCTz90N7K?=
 =?us-ascii?Q?Z/YRE7fFFSBLYw3KM/vKUbfjkkEVLw3sRHbvPElsDq8+W0uKFI0XyBOdOsaH?=
 =?us-ascii?Q?vtXCOOR+QQvWPXvPF9N7qKES0Z5UzxZcm46s5QFmzAlIqrf3394jWkfK9pGe?=
 =?us-ascii?Q?FdVaqkWZzmBYJqbN8J/02U3Kl8ZqzVSpywP+4K9hvy7bA1KLF+X7s+vG5nN5?=
 =?us-ascii?Q?RJnejBHktnau6GfLLUHkNesb2bmC3lQWJ8DYM+Cb0FkgSLku50O8FT9zeVG4?=
 =?us-ascii?Q?TbLuOA0Q+z7QiOvAnOjy73RRcJwwHS1SCWDfBcvF+eGlK8RbeHpK4kNStQew?=
 =?us-ascii?Q?Bo6bXNlVzzE0wd31Hd6pDFYjvxgMyiiJlisJvvXfQIhzhaHTeyFnwexsGuiC?=
 =?us-ascii?Q?kP0ou3edofevr1NdyAWSAaZ9c8O9eaaGPzxRYjsICiifmr77fJ0x4z1PcrU5?=
 =?us-ascii?Q?iSZoL4DVtGIIVIMDb6O5CXQu7vmo6FryzUMzOpUMqci9ED2ejU2k3d2BwZk3?=
 =?us-ascii?Q?iPvz11wBXpyDz9sOxH1JaVW0bovUYNqZJUAgqjlUnLETb6pAfLQay/mIn3tB?=
 =?us-ascii?Q?NNNKSB03mc7HCkhzb5RLsRvHSlNBDFp2Sdr46tWkraw6dj544eaKZ8ErgZ1a?=
 =?us-ascii?Q?wHsI0izlMEbFfXQbEXmy4uNVtZghNEDFr61dOtRCKsYFVmhOImnLOyVrkesj?=
 =?us-ascii?Q?q4fDjC8VC6x82utnOnJdLNc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0028.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46309eb-9414-4e78-13b0-08d99cdb74b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2021 02:01:01.8261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SS/Lj4Cnp2oQiVOuPXS1tsIkzS5BGc4wFUa+CoU6pOIwyXHFDhAiVJJogfOVPCn9fRetSUKCjqUnRhOFQ0LF8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5735
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

subscribe linux-i2c

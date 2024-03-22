Return-Path: <linux-i2c+bounces-2566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8BF8874D3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 23:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C321C2276D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 22:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAD77FBA7;
	Fri, 22 Mar 2024 22:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rfk4VMZW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1E81721;
	Fri, 22 Mar 2024 22:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711146509; cv=fail; b=Ac0SG3jfZtfBU7wGtvcQCvCQpnEemC8D4I5U/smuvoSuZ3eyq/ZvZ7f7k9bs2Lxq9Myy/MxhJ9wgBEATkv86x4rLmA4DaRlw9c2Y20h8m6t+WSwfJRauTXh7/qIt+1SwVVFklDYEdujrqyRLRhcRn5oDhDmeHg3XBkC6sWMoTEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711146509; c=relaxed/simple;
	bh=9sMwWrpv+ehdlPeJc65cJxdfjXMZgw/1IVBEjbwZ4sQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fHGNWQiiT/Sgq5DYdoF509HP3srwKeug6PG56444Hpmc6/18DfgNhBGA9z6RYSHOvRE5jTY7SdNkIez5ejakUXtRpllJQ/6A/0mF7AkcBXcoVfEN3VYynuJzMTyBxME6Q5ELjn+YC/Vd8R38ka6jQ/Yo5aNDq83SDGpLxHmDTqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rfk4VMZW; arc=fail smtp.client-ip=40.107.220.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXFGF3A4eITeSwO0pUMjd+Dro9nC+jOg2rZePMUXQvsyO/3OVZZwKNYzfM9CckgEneHhMEc4+3dS7SZBDsuzxcQLGMAHIpE9hajm5JnxSNX0Z0sPckGqaNS24XQFYl+OnIG77wT+ZQPnfwtdgfORyhASss1UttWO2g+oyMgyyN3T8iMKPJsLULBVf4N2kVC/DasOg3/m0AZpWS+fAhDF4FkBgTAJqpgm8u/A1NIoCw6f9cvNW2f+HxQw/08TsflQrGb8mVA9f+Z0Yn1VuvoS8XJNfIyH7FGr+E5dWx5Svw30auFQu88/vJ6cygu/o4XpmleRL1ViBnoSLhb2Ovxk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sMwWrpv+ehdlPeJc65cJxdfjXMZgw/1IVBEjbwZ4sQ=;
 b=YtgKTollOtNC/V7c0jTEXfJ7MARbS+nS1K6LEvFEpJ7hYd8rW5mC6xYI2PzWyNNbK6FcHZjN6Vljtd9TRcnBmmGEfmz8afwNFkruTb2SW1h6RLRugpcq9A+dTeDuedf/u3nET2NQB1dlTTJhwxosKeHTf8lbAD8xZm1qE0GX9mwUNVR3asx1RJg3Myraz5JxuUOu4gmd0p1co2+u80444Ov119IqTFn94G9ptQhdmGWA1lVnsw8jwa4ylmkvVxifSkshW8/BOeB2AxgWTBenMWOonjXV4dKE9Z+68a7spEx7awKWKddWXx7Svu3MkLMZl9FC8831sXWb8EaxfPDPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sMwWrpv+ehdlPeJc65cJxdfjXMZgw/1IVBEjbwZ4sQ=;
 b=Rfk4VMZWzDr0aPF8529ZylOmUvsbL7Rktqoe9G4DoUfhHWbWwL1Krv/m6+yeHH99ES18QCQVHbu98jT2ob460HOJ43VFj+QcEJbuYHDWNV/uuzQ6LA9cvW46LPfSKegS83NhJbr2LZq7S/oE/cO/99XFqipczR9YLJHlXRjjVsc0w5x2zyB8ublreZBzaRn0/yZRLnqWoavzLItRqITkQZz6BhQ2U6X2YHV5f/fk31/CYfD0gqb6o8f83446Fl/0WI2lz5xno3WhXvCGO89axDKj163+uPNm+B6pP4fdN6igtWcfygh5p/JAbCWgKW4JX3G/2c89RvJyC//1yOR/SA==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Fri, 22 Mar
 2024 22:28:24 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::87dc:5695:5e66:ae54]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::87dc:5695:5e66:ae54%4]) with mapi id 15.20.7409.022; Fri, 22 Mar 2024
 22:28:23 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: Michael Shych <michaelsh@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 35/64] i2c: mlxcpld: reword according to newest
 specification
Thread-Topic: [PATCH 35/64] i2c: mlxcpld: reword according to newest
 specification
Thread-Index: AQHafFyl5WOmejC/FkeDWLxt6qnFIbFEV5Vg
Date: Fri, 22 Mar 2024 22:28:23 +0000
Message-ID:
 <BN9PR12MB5381647AB3EB7B14DB1A6BD4AF312@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-36-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-36-wsa+renesas@sang-engineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|CH3PR12MB7572:EE_
x-ms-office365-filtering-correlation-id: eec61ce4-7dd8-4dc6-b14f-08dc4abf62e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zV50bm7uzWceV8dwoo97F8HF5teid7jqzjmzW24fpb5EedxOgRTN2uRU6qWXA+aJVIDJSKozvCvh4ThQXhu3nT9qmzbBPQOON19yzJ1tv04pn9NHcx9lq96b1+ibPEODnOhQng43Z/OYvdkpiIorOp4HxvJXtRFx4Oy9SnU5wXn5Lw5EInwq4jALaZfsJsXAccB53GJ9e5M0iQ0dqNIb7KD3zOIJLOA65GT6duVa8d7dHM54tWSsEIwHoLKBwg3A8koLonv02mimnQGGzu6G6COniDaLOCT9OfuyQS/bWIlfnGDBJUXSX5Z9yh4/oUTItrNc+hEbOTBVyZaz0RyqWje1vFk/+Irre44QBJ580n6pzfr71E4aPs1SR3ARNzGgGJ9C8ABjQMP/t21IFdb8j/wE8Y8r7qjSQWbWLz4U6U74p7chHyv01gzC+5BZowASH8QbqDXgbP36e3qhs1TfxU+JjP7GMhZ9LgWQMbxlhtgjMF9ca6BrOcPg7Kjds0XYCPuzoPO6VrCG6XV3UnNwQ2YgyfKElYpyUoX9E3Z/RD75FgthAp5xO01r0guxSx8bs/Pm4RkrOKoq+yZptr6/w+8N/Zu9Wxc/NMb3zUeSp6t1rgDbjoxpQ1ueY4MmqAvmTnsCPeIPqt83vRUQMWX6s4QsJd7BaxvTOqoHOZ0pKXWDfmDZwAwdhXa8GaP8Lfz0oHoy6Sb3/9wO/yOAG0TERKpCdnX90qcSSbNRwu/tYRQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkpEWjFMV2dFbUtGemFDZFBUOWt0SjR1cjBsRVN1L3JZRWFyTENhMmI5NTZD?=
 =?utf-8?B?bHJvODB6YkVCQ0hseUNudjhmWVkvci9MKzhpWUtrQzd1dngwR0kwV0xVZExs?=
 =?utf-8?B?bzJGRmk4S05XbmVsN2l4Wk55OVdkTHRwUWR0ZnFiSjY4ZSt3OTJTQzdCdXlP?=
 =?utf-8?B?TG5DU25YbjhwNjF5RlArQ1Vib0V6WnhlQVBReVJZQk1WM0tWUE1wN3VvRVV3?=
 =?utf-8?B?b2ZwT0IzeFl2UHFlZTZKbUFTdW9leVpMQkFpWG5hSC9mVEcwalFmYTkranFP?=
 =?utf-8?B?YlVaeC9iRDVmMWJOd01MYnJ2V2I3enZrNG1yeGl5RFlGZmNFaUFBU1BhZ2w5?=
 =?utf-8?B?NkJwWkNKRTNCYXVoV3FZSU9GamlScVBvR1lVWHo5SXFWN2QvR252UFRJZC9F?=
 =?utf-8?B?aGVMeTZkTlc1c2llZjJrUkZ1QVFWL0FIU0V6R0pYL0tvcXpTV3A5R05rUlhD?=
 =?utf-8?B?dWJ0UE14ak9SSFRJTExJUTNXV1FXaTNucml0Nk90K3BkTXJIZ1VHcmh3NXVC?=
 =?utf-8?B?dDRiWk1zT3N1RFZPUG9ETHN3NkpoZUVpeUxxOWdyeWpDY2NKYVBudUhKZkc4?=
 =?utf-8?B?WjN3bDVZM2ZnL0d3UDlGamU5NFlLUlgwakxWRGh3OGJQTHRWL3Fqd05iZWwx?=
 =?utf-8?B?SGFvMFZKb1pwL1BZbjllQXhIY2xsWGxCazRjL2VvM2NwYnNQeXdubXlZakZ0?=
 =?utf-8?B?WUNSck1kV2NxMnlJWHJ2T1l5RUlEM0J6dVlYTU9FWG9RS2xFNzNJbS9Sa0Vv?=
 =?utf-8?B?YzFXbjR1YXp1MXVlWmJmV3paNDhMNjdBd2pwekQzekFjbUZWY2VMTmZvMUp1?=
 =?utf-8?B?S0lCZ25aR09TTTRYRkJaeklrUTBLc0lCVnVPZS9mYUZESHdSVmd1ZGE2Si9J?=
 =?utf-8?B?UEtydDhoUnU1am1ERndOdUk4RnVRYU54Q3ltN3ZQTnlYVjNsQk9SM2drVGpD?=
 =?utf-8?B?T3RlbVRmVUc3N1RwMERCQnZ1NlZXS1RSUStDMEpheHJSNk55UFNwSVhqR1Za?=
 =?utf-8?B?Ymh4NFY0UzRkcUVlRDJqcEY3ZE5YSkNkWmQxaWJRa21yR2RRL1puVGZ3OEsx?=
 =?utf-8?B?a2NTN25Sd1p5TzhNTngxT0dIcmdld1c1N0J5M1JPN2dOdVZwOGVpMW9Rdzdi?=
 =?utf-8?B?THhMcWhXdHpkSnRCVzczNzV4aE41SnZzWksySllMNGdXR2kxdW5qU2plTWhn?=
 =?utf-8?B?ZGN1R0pZQng4RnJDRmQ4WnR2OGg1VFJYYWFPMzlYNndPeXJPdVBZZC80YXdq?=
 =?utf-8?B?WFZsUWZCZlRGTkJ2MkpHYjVnOXJsR1JWZHMxUDBuV0tER29jSFN2amJVOXh2?=
 =?utf-8?B?T1BRVzlHQlBEYTYrWnFnaXlsVEJXdGQvTkg2RThRY2Q1eko4dStrMkZnVUlZ?=
 =?utf-8?B?dEtzd1lIMGRUc0lVV1JLdWl2b2JwY1N3STJwVHRlMExhZ2hmWnFERmx4cmZv?=
 =?utf-8?B?VFhiK0JPQTRhY3RuT1BkMkltVFBVUTE4dnF0QTdLUDZKVmc2OW5yL2J5RGlp?=
 =?utf-8?B?eGVER09rbi9WelhEU1JhR1c5SWwwRjFGcFhUZzdnL0Q2dGMraHVPTVNNV2dJ?=
 =?utf-8?B?RHh3eDlhemNEK0M4bDlxZE54dXBuNFVMQkM1aGZvQ0g3TVd4eVZtbm5tOGs3?=
 =?utf-8?B?T21MU0htM2hmRGd3MFhlZVBlOWE5WXRyK3EwT3NYV1BjVXRtUjNDU3o4cStP?=
 =?utf-8?B?cDFYWnhINEhNRzZ5SFFnNEhQUTV0clllMFZDS3huOVhhV2YrUjNZM0ttTFp0?=
 =?utf-8?B?VXh4L21Yb1N1VWNlb3JpYktVSHBIY29IdG9SaHNZenA4eGo4QjY4SEp4b3VI?=
 =?utf-8?B?aFRkdU5icHh4ZzQ4cFFXTGtZNzhmYkZCUmhJWm9UNEFKQlBYKzJ0OHpBTFBj?=
 =?utf-8?B?YTVYOWhyaGovQlBIQ3hBSkw3ME80V0dWV0JNYUpqT1prR2FtTGt3R2l4bHp1?=
 =?utf-8?B?S1Vwck5yU3FXcXFqNGRJN2gvQ2lHWE9jU3VxQkxMaW95ZFV1Yk9qRHhZOVFV?=
 =?utf-8?B?R3JQdGN5U1VMTFpjSllPZmVzSXZwSTFMNTZvUS9WYWNHSEl5dzJoNTRVSWdN?=
 =?utf-8?B?UVNPb3RTdGZQTmZnNkZiYmxHalJlM0s4UE5xZXBVOTNsNVBLbGsrVDgyU2tI?=
 =?utf-8?Q?8Das=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec61ce4-7dd8-4dc6-b14f-08dc4abf62e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 22:28:23.8013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sG8rfpO82hsHwv9eqAjV+JaTKQLaVXUc/fQfgxAvHbK5j4vPK6HAMulwr2BYFtzOsnBbDiAXWQiqdiFyPlePUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV29sZnJhbSBTYW5nIDx3
c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4NCj4gU2VudDogRnJpZGF5LCAyMiBNYXJj
aCAyMDI0IDE1OjI1DQo+IFRvOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IENjOiBXb2xm
cmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPjsgVmFkaW0gUGFzdGVy
bmFrDQo+IDx2YWRpbXBAbnZpZGlhLmNvbT47IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxzaEBudmlk
aWEuY29tPjsgQW5kaSBTaHl0aQ0KPiA8YW5kaS5zaHl0aUBrZXJuZWwub3JnPjsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggMzUvNjRdIGkyYzogbWx4Y3Bs
ZDogcmV3b3JkIGFjY29yZGluZyB0byBuZXdlc3Qgc3BlY2lmaWNhdGlvbg0KPiANCj4gTWF0Y2gg
dGhlIHdvcmRpbmcgb2YgdGhpcyBkcml2ZXIgd3J0LiB0aGUgbmV3ZXN0IEkyQyB2NywgU01CdXMg
My4yLCBJM0MNCj4gc3BlY2lmaWNhdGlvbnMgYW5kIHJlcGxhY2UgIm1hc3Rlci9zbGF2ZSIgd2l0
aCBtb3JlIGFwcHJvcHJpYXRlIHRlcm1zLg0KPiBUaGV5IGFyZSBhbHNvIG1vcmUgc3BlY2lmaWMg
YmVjYXVzZSB3ZSBkaXN0aW5ndWlzaCBub3cgYmV0d2VlbiBhIHJlbW90ZQ0KPiBlbnRpdHkgKCJj
bGllbnQiKSBhbmQgYSBsb2NhbCBvbmUgKCJ0YXJnZXQiKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQoNCkFja2Vk
LWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tbHhjcGxkLmMgfCAxMiArKysrKystLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tbHhjcGxkLmMgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLQ0KPiBtbHhjcGxkLmMNCj4gaW5kZXggMDk5MjkxYTA0MTFkLi43ODZkNGM1MWY2NWEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWx4Y3BsZC5jDQo+ICsrKyBi
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWx4Y3BsZC5jDQo+IEBAIC0xOTcsOCArMTk3LDggQEAg
c3RhdGljIGludCBtbHhjcGxkX2kyY19jaGVja19zdGF0dXMoc3RydWN0DQo+IG1seGNwbGRfaTJj
X3ByaXYgKnByaXYsIGludCAqc3RhdHVzKQ0KPiAgCWlmICh2YWwgJiBNTFhDUExEX0xQQ0kyQ19U
UkFOU19FTkQpIHsNCj4gIAkJaWYgKHZhbCAmIE1MWENQTERfTFBDSTJDX1NUQVRVU19OQUNLKQ0K
PiAgCQkJLyoNCj4gLQkJCSAqIFRoZSBzbGF2ZSBpcyB1bmFibGUgdG8gYWNjZXB0IHRoZSBkYXRh
LiBObyBzdWNoDQo+IC0JCQkgKiBzbGF2ZSwgY29tbWFuZCBub3QgdW5kZXJzdG9vZCwgb3IgdW5h
YmxlIHRvDQo+IGFjY2VwdA0KPiArCQkJICogVGhlIGNsaWVudCBpcyB1bmFibGUgdG8gYWNjZXB0
IHRoZSBkYXRhLiBObyBzdWNoDQo+ICsJCQkgKiBjbGllbnQsIGNvbW1hbmQgbm90IHVuZGVyc3Rv
b2QsIG9yIHVuYWJsZSB0bw0KPiBhY2NlcHQNCj4gIAkJCSAqIGFueSBtb3JlIGRhdGEuDQo+ICAJ
CQkgKi8NCj4gIAkJCSpzdGF0dXMgPSBNTFhDUExEX0xQQ0kyQ19OQUNLX0lORDsNCj4gQEAgLTI4
MCw3ICsyODAsNyBAQCBzdGF0aWMgaW50IG1seGNwbGRfaTJjX3dhaXRfZm9yX2ZyZWUoc3RydWN0
DQo+IG1seGNwbGRfaTJjX3ByaXYgKnByaXYpICB9DQo+IA0KPiAgLyoNCj4gLSAqIFdhaXQgZm9y
IG1hc3RlciB0cmFuc2ZlciB0byBjb21wbGV0ZS4NCj4gKyAqIFdhaXQgZm9yIGhvc3QgdHJhbnNm
ZXIgdG8gY29tcGxldGUuDQo+ICAgKiBJdCBwdXRzIGN1cnJlbnQgcHJvY2VzcyB0byBzbGVlcCB1
bnRpbCB3ZSBnZXQgaW50ZXJydXB0IG9yIHRpbWVvdXQgZXhwaXJlcy4NCj4gICAqIFJldHVybnMg
dGhlIG51bWJlciBvZiB0cmFuc2ZlcnJlZCBvciByZWFkIGJ5dGVzIG9yIGVycm9yICg8MCkuDQo+
ICAgKi8NCj4gQEAgLTMxNSw3ICszMTUsNyBAQCBzdGF0aWMgaW50IG1seGNwbGRfaTJjX3dhaXRf
Zm9yX3RjKHN0cnVjdA0KPiBtbHhjcGxkX2kyY19wcml2ICpwcml2KQ0KPiAgCQkvKg0KPiAgCQkg
KiBBY3R1YWwgcmVhZCBkYXRhIGxlbiB3aWxsIGJlIGFsd2F5cyB0aGUgc2FtZSBhcw0KPiAgCQkg
KiByZXF1ZXN0ZWQgbGVuLiAweGZmIChsaW5lIHB1bGwtdXApIHdpbGwgYmUgcmV0dXJuZWQNCj4g
LQkJICogaWYgc2xhdmUgaGFzIG5vIGRhdGEgdG8gcmV0dXJuLiBUaHVzIGRvbid0IHJlYWQNCj4g
KwkJICogaWYgY2xpZW50IGhhcyBubyBkYXRhIHRvIHJldHVybi4gVGh1cyBkb24ndCByZWFkDQo+
ICAJCSAqIE1MWENQTERfTFBDSTJDX05VTV9EQVRfUkVHIHJlZyBmcm9tIENQTEQuICBPbmx5IGlu
DQo+IGNhc2Ugb2YNCj4gIAkJICogU01CdXMgYmxvY2sgcmVhZCB0cmFuc2FjdGlvbiBkYXRhIGxl
biBjYW4gYmUgZGlmZmVyZW50LA0KPiAgCQkgKiBjaGVjayB0aGlzIGNhc2UuDQo+IEBAIC0zNzUs
NyArMzc1LDcgQEAgc3RhdGljIHZvaWQgbWx4Y3BsZF9pMmNfeGZlcl9tc2coc3RydWN0DQo+IG1s
eGNwbGRfaTJjX3ByaXYgKnByaXYpDQo+ICAJfQ0KPiANCj4gIAkvKg0KPiAtCSAqIFNldCB0YXJn
ZXQgc2xhdmUgYWRkcmVzcyB3aXRoIGNvbW1hbmQgZm9yIG1hc3RlciB0cmFuc2Zlci4NCj4gKwkg
KiBTZXQgY2xpZW50IGFkZHJlc3Mgd2l0aCBjb21tYW5kIGZvciBob3N0IHRyYW5zZmVyLg0KPiAg
CSAqIEl0IHNob3VsZCBiZSBsYXRlc3QgZXhlY3V0ZWQgZnVuY3Rpb24gYmVmb3JlIENQTEQgdHJh
bnNhY3Rpb24uDQo+ICAJICovDQo+ICAJY21kID0gKHByaXYtPnhmZXIubXNnWzBdLmFkZHIgPDwg
MSkgfCBwcml2LT54ZmVyLmNtZDsgQEAgLTQ0OSw3DQo+ICs0NDksNyBAQCBzdGF0aWMgdTMyIG1s
eGNwbGRfaTJjX2Z1bmMoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKSAgfQ0KPiANCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaTJjX2FsZ29yaXRobSBtbHhjcGxkX2kyY19hbGdvID0gew0KPiAtCS5t
YXN0ZXJfeGZlcgk9IG1seGNwbGRfaTJjX3hmZXIsDQo+ICsJLnhmZXIJPSBtbHhjcGxkX2kyY194
ZmVyLA0KPiAgCS5mdW5jdGlvbmFsaXR5CT0gbWx4Y3BsZF9pMmNfZnVuYw0KPiAgfTsNCj4gDQo+
IC0tDQo+IDIuNDMuMA0KDQo=

